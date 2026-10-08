import 'package:flutter_test/flutter_test.dart';
import 'package:webspark_test/features/path_finding/presentation/validators/api_url_validator.dart';

void main() {
  const validator = ApiUrlValidator();
  final accepted = <String, String>{
    '  flutter.webspark.dev/flutter/api?x=1&x=2  ':
        'https://flutter.webspark.dev/flutter/api?x=1&x=2',
    'HTTPS://EXAMPLE.COM/API': 'https://example.com/API',
    'example.com:8443/api': 'https://example.com:8443/api',
    '//example.com/api': 'https://example.com/api',
    'localhost:8080/api': 'http://localhost:8080/api',
    'localhost.evil.com': 'https://localhost.evil.com',
    '10.example.com': 'https://10.example.com',
    '127.0.0.1.evil.com': 'https://127.0.0.1.evil.com',
    '172.16.0.1/api': 'http://172.16.0.1/api',
    '172.31.255.254': 'http://172.31.255.254',
    '172.32.0.1': 'https://172.32.0.1',
    '192.168.0.1:3000': 'http://192.168.0.1:3000',
    '127.2.3.4': 'http://127.2.3.4',
    '169.254.1.1': 'http://169.254.1.1',
    '8.8.8.8': 'https://8.8.8.8',
    '[::1]:8080/api': 'http://[::1]:8080/api',
    '[fd00::1]': 'http://[fd00::1]',
    '[2001:db8::1]': 'https://[2001:db8::1]',
    '[::ffff:192.168.1.1]': 'http://[::ffff:192.168.1.1]',
    'http://intranet/api': 'http://intranet/api',
    'http://example.com/api': 'http://example.com/api',
    'https://localhost:8080': 'https://localhost:8080',
    'https://example.com:443': 'https://example.com',
    'https://example.com:65535': 'https://example.com:65535',
    'https://example.com:1': 'https://example.com:1',
    'example.com./api': 'https://example.com./api',
    'xn--e1afmkfd.xn--p1ai': 'https://xn--e1afmkfd.xn--p1ai',
    'https://example.com/api?x=1&x=2&q=a+b&empty=&url=https%3A%2F%2Fa.com':
        'https://example.com/api?x=1&x=2&q=a+b&empty=&url=https%3A%2F%2Fa.com',
    'https://example.com/api?q=%23tag&x=%25':
        'https://example.com/api?q=%23tag&x=%25',
    'https://example.com/тест?q=так':
        'https://example.com/%D1%82%D0%B5%D1%81%D1%82?q=%D1%82%D0%B0%D0%BA',
    'https://example.com/api?': 'https://example.com/api?',
    'приклад.укр': 'https://xn--80aikifvh.xn--j1amh',
    'https://приклад.укр/api?limit=10': 'https://xn--80aikifvh.xn--j1amh/api?limit=10',
    'https://ПРИКЛАД.УКР/api': 'https://xn--80aikifvh.xn--j1amh/api',
  };
  final rejected = <String?>[
    null,
    '',
    '   ',
    'hello',
    '/api',
    'https://',
    'https:///api',
    'http:example.com',
    'https:/example.com',
    'ftp://example.com',
    'mailto:user@example.com',
    'javascript:alert(1)',
    'file:///tmp/a',
    'example.com/api x',
    'https://example.com/a\nb',
    'https://exam\u200Bple.com',
    r'https://example.com\api',
    'https://example.com/%',
    'https://example.com/%GG',
    'https://example.com/%1',
    'https://example.com/#tag',
    'https://example.com/#',
    'https://user:pass@example.com',
    'https://@example.com',
    'https://example..com',
    'https://.example.com',
    'https://-example.com',
    'https://example-.com',
    'https://exam_ple.com',
    'https://example.123',
    'http://256.1.1.1',
    'http://127.1',
    'http://127.00.0.1',
    'http://2130706433',
    'https://example.com:',
    'https://example.com:0',
    'https://example.com:65536',
    'https://example.com:-1',
    'https://example.com:abc',
    'https://example.com:+80',
    'https://example.com:80:90',
    'https://example.com:99999999999999999999999',
    'http://::1',
    'http://[::1',
    'http://[::1]oops',
    'http://[gg::1]',
    'http://[1:2:3]',
    'http://[fe80::1%25en0]',
    'https://-приклад.укр',
    'https://приклад-.укр',
    'https://приклад..укр',
    'https://%65xample.com',
    'https://:8080/api',
    'https://${List.filled(64, 'a').join()}.com',
    'https://${List.filled(4, List.filled(63, 'a').join()).join('.')}',
  ];

  group('ApiUrlValidator accepts and normalizes supported URLs', () {
    for (final entry in accepted.entries) {
      test(entry.key, () {
        validator
            .validate(entry.key)
            .fold(
              (failure) => fail(failure.message),
              (actual) => expect(actual, entry.value),
            );
      });
    }
  });

  group('ApiUrlValidator rejects unsupported or malformed input', () {
    for (var i = 0; i < rejected.length; i++) {
      final input = rejected[i];
      test('case $i: ${input ?? '<null>'}', () {
        validator.validate(input).fold((failure) {
          expect(failure, isA<InvalidUrlFailure>());
          expect(failure.message, isNotEmpty);
        }, (value) => fail('Unexpected valid URL: $value'));
      });
    }
  });

  group('ApiUrlValidator normalization is idempotent', () {
    for (final normalized in accepted.values) {
      test(normalized, () {
        validator
            .validate(normalized)
            .fold(
              (failure) => fail(failure.message),
              (actual) => expect(actual, normalized),
            );
      });
    }
  });
}
