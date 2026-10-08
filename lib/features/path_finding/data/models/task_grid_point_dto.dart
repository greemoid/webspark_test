import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_grid_point_dto.freezed.dart';
part 'task_grid_point_dto.g.dart';

@freezed
abstract class TaskGridPointDto with _$TaskGridPointDto {
  const factory TaskGridPointDto({required int x, required int y}) =
      _TaskGridPointDto;

  factory TaskGridPointDto.fromJson(Map<String, dynamic> json) =>
      _$TaskGridPointDtoFromJson(json);
}
