import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';
import 'grid.dart';

enum DiagonalRule {
  bothSidesOpen,
  atLeastOneSideOpen,
  destinationOnly,
}

final class MovementPolicy {
  const MovementPolicy({required this.diagonalRule});

  final DiagonalRule diagonalRule;

  static const _directions = <GridPoint>[
    GridPoint(x: 0, y: -1),
    GridPoint(x: 1, y: 0),
    GridPoint(x: 0, y: 1),
    GridPoint(x: -1, y: 0),
    GridPoint(x: 1, y: -1),
    GridPoint(x: 1, y: 1),
    GridPoint(x: -1, y: 1),
    GridPoint(x: -1, y: -1),
  ];

  bool canMove(Grid grid, GridPoint from, GridPoint to) {
    if (!grid.isWalkable(from) || !grid.isWalkable(to)) return false;
    final dx = (to.x - from.x).abs();
    final dy = (to.y - from.y).abs();
    if (dx > 1 || dy > 1 || dx + dy == 0) return false;
    if (dx == 0 || dy == 0) return true;
    final horizontal = grid.isWalkable(GridPoint(x: to.x, y: from.y));
    final vertical = grid.isWalkable(GridPoint(x: from.x, y: to.y));
    return switch (diagonalRule) {
      DiagonalRule.bothSidesOpen => horizontal && vertical,
      DiagonalRule.atLeastOneSideOpen => horizontal || vertical,
      DiagonalRule.destinationOnly => true,
    };
  }

  Iterable<GridPoint> neighbors(Grid grid, GridPoint point) sync* {
    for (final direction in _directions) {
      final candidate = GridPoint(x: point.x + direction.x, y: point.y + direction.y);
      if (canMove(grid, point, candidate)) yield candidate;
    }
  }
}
