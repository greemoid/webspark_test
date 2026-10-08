import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_grid_point_dto.freezed.dart';
part 'result_grid_point_dto.g.dart';

@freezed
abstract class ResultGridPointDto with _$ResultGridPointDto {
  const factory ResultGridPointDto({required String x, required String y}) =
      _ResultGridPointDto;

  factory ResultGridPointDto.fromJson(Map<String, dynamic> json) =>
      _$ResultGridPointDtoFromJson(json);
}
