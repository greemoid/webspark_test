import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';

part 'path_result.freezed.dart';

@freezed
abstract class PathResult with _$PathResult {
  const factory PathResult({
    required String id,
    required List<GridPoint> steps,
    required String path,
  }) = _PathResult;
}
