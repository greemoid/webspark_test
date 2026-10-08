import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';

part 'path_task.freezed.dart';

@freezed
abstract class PathTask with _$PathTask {
  const factory PathTask({
    required String id,
    required List<String> field,
    required GridPoint start,
    required GridPoint end,
  }) = _PathTask;
}
