import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_dto.freezed.dart';
part 'base_response_dto.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BaseResponseDto<T> with _$BaseResponseDto<T> {
  const factory BaseResponseDto({
    required bool error,
    required String message,
    required List<T> data,
  }) = _BaseResponseDto;

  factory BaseResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$BaseResponseDtoFromJson(json, fromJsonT);
}
