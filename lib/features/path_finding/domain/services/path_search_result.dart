import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';

sealed class PathSearchResult {
  const PathSearchResult();
}

final class FoundPath extends PathSearchResult {
  FoundPath(Iterable<GridPoint> points)
    : steps = List<GridPoint>.unmodifiable(points) {
    if (steps.isEmpty) throw ArgumentError('A found path cannot be empty');
  }

  final List<GridPoint> steps;
  int get moveCount => steps.length - 1;
}

final class UnreachablePath extends PathSearchResult {
  const UnreachablePath();
}
