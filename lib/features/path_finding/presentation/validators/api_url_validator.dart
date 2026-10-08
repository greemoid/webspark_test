import 'package:commons_validator/commons_validator.dart' show unicodeToAscii;
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:webspark_test/core/cubits/base/failure.dart';

class InvalidUrlFailure extends Failure {
  const InvalidUrlFailure(String message) : super(message: message);
}

@lazySingleton
class ApiUrlValidator {
  const ApiUrlValidator();

  static final _forbiddenCharacters = RegExp(
    r'[\s\x00-\x20\x7F-\x9F\u00AD\u061C\u1680\u180E'
    r'\u2000-\u200F\u2028-\u202F\u205F-\u206F\u3000\uFEFF]',
    unicode: true,
  );
  static final _schemePrefix = RegExp(r'^([a-zA-Z][a-zA-Z0-9+.-]*):');
  static final _badPercentEncoding = RegExp(r'%(?![0-9a-fA-F]{2})');
  static final _digits = RegExp(r'^[0-9]+$');
  static final _numericHost = RegExp(r'^[0-9.]+$');
  static final _domainLabel = RegExp(r'^[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?$');

  Either<Failure, String> validate(String? input) {
    final value = input?.trim() ?? '';
    if (value.isEmpty) {
      return left(const InvalidUrlFailure('URL cannot be empty'));
    }
    try {
      return right(_normalize(value));
    } on FormatException catch (error) {
      return left(InvalidUrlFailure(error.message));
    }
  }

  String _normalize(String value) {
    if (_forbiddenCharacters.hasMatch(value)) {
      throw const FormatException(
        'URL cannot contain whitespace or invisible control characters',
      );
    }
    if (value.contains('\\')) {
      throw const FormatException('Use forward slashes (/) in the URL');
    }
    if (_badPercentEncoding.hasMatch(value)) {
      throw const FormatException(
        'Invalid percent encoding: use % followed by two hex digits',
      );
    }
    if (value.contains('#')) {
      throw const FormatException(
        'Remove the fragment (#...) from the API URL',
      );
    }

    final parts = _splitScheme(value);
    final separator = parts.rest.indexOf(RegExp(r'[/?#]'));
    final authority = separator < 0
        ? parts.rest
        : parts.rest.substring(0, separator);
    final suffix = separator < 0 ? '' : parts.rest.substring(separator);
    if (authority.isEmpty) {
      throw const FormatException('URL must contain a host');
    }
    if (authority.contains('@')) {
      throw const FormatException(
        'Credentials in the API URL are not supported',
      );
    }

    final address = _parseAuthority(authority);
    final host = address.ipv6 ? address.host.toLowerCase() : _normalizeDomain(address.host);
    _validateHost(
      host,
      ipv6: address.ipv6,
      explicitScheme: parts.scheme != null,
    );

    final portText = address.port;
    if (portText != null) {
      final port = _digits.hasMatch(portText) ? int.tryParse(portText) : null;
      if (port == null || port < 1 || port > 65535) {
        throw const FormatException(
          'Port must be a number between 1 and 65535',
        );
      }
    }

    final scheme =
        parts.scheme ??
        (_isLocalHost(host, ipv6: address.ipv6) ? 'http' : 'https');
    final formattedHost = address.ipv6 ? '[$host]' : host;
    final formattedPort = portText == null ? '' : ':$portText';
    final uri = Uri.tryParse('$scheme://$formattedHost$formattedPort$suffix');
    if (uri == null || !uri.hasAuthority || uri.host.isEmpty) {
      throw const FormatException('Invalid URL format');
    }
    return uri.toString();
  }

  ({String? scheme, String rest}) _splitScheme(String value) {
    if (value.startsWith('//')) {
      return (scheme: null, rest: value.substring(2));
    }
    final match = _schemePrefix.firstMatch(value);
    if (match == null) return (scheme: null, rest: value);
    final prefix = match.group(1)!.toLowerCase();
    final rest = value.substring(match.end);
    if (prefix == 'http' || prefix == 'https') {
      if (!rest.startsWith('//')) {
        throw const FormatException('Use http:// or https:// before the host');
      }
      return (scheme: prefix, rest: rest.substring(2));
    }
    // A dotted host or localhost followed by :port is not a scheme.
    if (!rest.startsWith('//') &&
        (prefix.contains('.') || prefix == 'localhost')) {
      return (scheme: null, rest: value);
    }
    throw const FormatException(
      'URL must use http or https; for an internal host, include the scheme',
    );
  }

  ({String host, String? port, bool ipv6}) _parseAuthority(String authority) {
    if (authority.startsWith('[')) {
      final closing = authority.indexOf(']');
      if (closing < 0) {
        throw const FormatException(
          'IPv6 addresses must be enclosed in [brackets]',
        );
      }
      final remainder = authority.substring(closing + 1);
      if (remainder.isNotEmpty && !remainder.startsWith(':')) {
        throw const FormatException('Invalid text after the IPv6 address');
      }
      return (
        host: authority.substring(1, closing),
        port: remainder.isEmpty ? null : remainder.substring(1),
        ipv6: true,
      );
    }
    final colon = authority.indexOf(':');
    if (colon != authority.lastIndexOf(':')) {
      throw const FormatException(
        'IPv6 addresses must be enclosed in [brackets]',
      );
    }
    return (
      host: colon < 0 ? authority : authority.substring(0, colon),
      port: colon < 0 ? null : authority.substring(colon + 1),
      ipv6: false,
    );
  }

  String _normalizeDomain(String host) {
    if (host.isEmpty) {
      throw const FormatException('URL must contain a host');
    }
    final asciiHost = unicodeToAscii(host).toLowerCase();
    // The package returns the original input when conversion fails.
    if (asciiHost.codeUnits.any((unit) => unit > 127)) {
      throw const FormatException(
        'The domain contains invalid or unsupported characters',
      );
    }
    return asciiHost;
  }

  void _validateHost(
    String host, {
    required bool ipv6,
    required bool explicitScheme,
  }) {
    if (host.isEmpty) throw const FormatException('URL must contain a host');
    if (ipv6) {
      if (host.contains('%')) {
        throw const FormatException('IPv6 zone identifiers are not supported');
      }
      try {
        Uri.parseIPv6Address(host);
      } on FormatException {
        throw const FormatException('Invalid IPv6 address');
      }
      return;
    }
    if (_numericHost.hasMatch(host)) {
      try {
        if (host
            .split('.')
            .any((part) => part.length > 1 && part.startsWith('0'))) {
          throw const FormatException('Leading zero in IPv4');
        }
        Uri.parseIPv4Address(host);
      } on FormatException {
        throw const FormatException(
          'Use four IPv4 numbers from 0 to 255 without leading zeros',
        );
      }
      return;
    }
    final name = host.endsWith('.') ? host.substring(0, host.length - 1) : host;
    final labels = name.split('.');
    if (name.length > 253 ||
        labels.any((label) => !_domainLabel.hasMatch(label))) {
      throw const FormatException(
        'Invalid hostname: check dots, hyphens and label lengths',
      );
    }
    if (_digits.hasMatch(labels.last)) {
      throw const FormatException(
        'The final domain label cannot consist only of numbers',
      );
    }
    if (labels.length == 1 && name != 'localhost' && !explicitScheme) {
      throw const FormatException(
        'Enter a full domain, or include http:// or https:// for an internal host',
      );
    }
  }

  bool _isLocalHost(String host, {required bool ipv6}) {
    if (ipv6) {
      final bytes = Uri.parseIPv6Address(host);
      final loopback =
          bytes.take(15).every((byte) => byte == 0) && bytes.last == 1;
      final uniqueLocal = (bytes[0] & 0xfe) == 0xfc;
      final linkLocal = bytes[0] == 0xfe && (bytes[1] & 0xc0) == 0x80;
      final mappedIpv4 =
          bytes.take(10).every((byte) => byte == 0) &&
          bytes[10] == 0xff &&
          bytes[11] == 0xff;
      return loopback ||
          uniqueLocal ||
          linkLocal ||
          (mappedIpv4 && _isLocalIpv4(bytes.sublist(12)));
    }
    final name = host.endsWith('.') ? host.substring(0, host.length - 1) : host;
    if (name == 'localhost' || name.endsWith('.localhost')) return true;
    return _numericHost.hasMatch(host) &&
        _isLocalIpv4(Uri.parseIPv4Address(host));
  }

  bool _isLocalIpv4(List<int> bytes) {
    return bytes[0] == 127 ||
        bytes[0] == 10 ||
        (bytes[0] == 172 && bytes[1] >= 16 && bytes[1] <= 31) ||
        (bytes[0] == 192 && bytes[1] == 168) ||
        (bytes[0] == 169 && bytes[1] == 254);
  }
}
