import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_point.freezed.dart';

@freezed
abstract class GridPoint with _$GridPoint {
  const factory GridPoint({required int x, required int y}) = _GridPoint;
}
