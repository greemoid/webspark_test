import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webspark_test/features/path_finding/data/models/task_grid_point_dto.dart';

part 'path_task_dto.freezed.dart';
part 'path_task_dto.g.dart';

@freezed
abstract class PathTaskDto with _$PathTaskDto {
  const factory PathTaskDto({
    required String id,
    required List<String> field,
    required TaskGridPointDto start,
    required TaskGridPointDto end,
  }) = _PathTaskDto;

  factory PathTaskDto.fromJson(Map<String, dynamic> json) =>
      _$PathTaskDtoFromJson(json);
}
