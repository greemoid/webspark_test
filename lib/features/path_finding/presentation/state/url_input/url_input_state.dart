import 'package:freezed_annotation/freezed_annotation.dart';

part 'url_input_state.freezed.dart';

@freezed
sealed class UrlInputState with _$UrlInputState {
  const factory UrlInputState.initial({
    @Default('') String url,
  }) = _Initial;

  const factory UrlInputState.loading({
    required String url,
  }) = _Loading;

  const factory UrlInputState.error({
    required String url,
    required String message,
  }) = _Error;

  const factory UrlInputState.success({
    required String url,
  }) = _Success;
}
