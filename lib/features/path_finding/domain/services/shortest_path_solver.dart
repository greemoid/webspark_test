import 'dart:collection';

import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';

import 'grid.dart';
import 'movement_policy.dart';
import 'path_search_result.dart';

abstract interface class ShortestPathSolver {
  PathSearchResult solve({
    required Grid grid,
    required GridPoint start,
    required GridPoint end,
  });
}

final class BfsShortestPathSolver implements ShortestPathSolver {
  const BfsShortestPathSolver({required this.movement});

  final MovementPolicy movement;

  @override
  PathSearchResult solve({
    required Grid grid,
    required GridPoint start,
    required GridPoint end,
  }) {
    if (!grid.isWalkable(start)) {
      throw ArgumentError.value(start, 'start', 'Must be an open cell');
    }
    if (!grid.isWalkable(end)) {
      throw ArgumentError.value(end, 'end', 'Must be an open cell');
    }

    int indexOf(GridPoint p) => p.y * grid.size + p.x;
    GridPoint pointAt(int index) =>
        GridPoint(x: index % grid.size, y: index ~/ grid.size);

    final startIndex = indexOf(start);
    final endIndex = indexOf(end);
    // undiscovered is -1, parent of start is itself
    final parents = List<int>.filled(grid.cellCount, -1);
    parents[startIndex] = startIndex;
    final queue = ListQueue<int>()..addLast(startIndex);

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();
      if (current == endIndex) {
        final reversed = <GridPoint>[];
        var cursor = endIndex;
        while (cursor != startIndex) {
          reversed.add(pointAt(cursor));
          cursor = parents[cursor];
        }
        reversed.add(start);
        return FoundPath(reversed.reversed);
      }

      for (final neighbor in movement.neighbors(grid, pointAt(current))) {
        final next = indexOf(neighbor);
        if (parents[next] != -1) continue;
        // mark on enqueue
        parents[next] = current;
        queue.addLast(next);
      }
    }
    return const UnreachablePath();
  }
}
