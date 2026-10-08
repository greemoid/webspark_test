import 'package:freezed_annotation/freezed_annotation.dart';

part 'path_verification_dto.freezed.dart';
part 'path_verification_dto.g.dart';

@freezed
abstract class PathVerificationDto with _$PathVerificationDto {
  const factory PathVerificationDto({
    required String id,
    required bool correct,
  }) = _PathVerificationDto;

  factory PathVerificationDto.fromJson(Map<String, dynamic> json) =>
      _$PathVerificationDtoFromJson(json);
}
