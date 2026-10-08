import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webspark_test/features/path_finding/data/models/result_grid_point_dto.dart';

part 'path_result_payload_dto.freezed.dart';
part 'path_result_payload_dto.g.dart';

@freezed
abstract class PathResultPayloadDto with _$PathResultPayloadDto {
  const factory PathResultPayloadDto({
    required List<ResultGridPointDto> steps,
    required String path,
  }) = _PathResultPayloadDto;

  factory PathResultPayloadDto.fromJson(Map<String, dynamic> json) =>
      _$PathResultPayloadDtoFromJson(json);
}
