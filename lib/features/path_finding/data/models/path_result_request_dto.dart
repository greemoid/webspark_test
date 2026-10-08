import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webspark_test/features/path_finding/data/models/path_result_payload_dto.dart';

part 'path_result_request_dto.freezed.dart';
part 'path_result_request_dto.g.dart';

@freezed
abstract class PathResultRequestDto with _$PathResultRequestDto {
  const factory PathResultRequestDto({
    required String id,
    required PathResultPayloadDto result,
  }) = _PathResultRequestDto;

  factory PathResultRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PathResultRequestDtoFromJson(json);
}
