import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';
import 'package:webspark_test/features/path_finding/domain/services/grid.dart';
import 'package:webspark_test/features/path_finding/domain/services/movement_policy.dart';
import 'package:webspark_test/features/path_finding/domain/services/path_search_result.dart';
import 'package:webspark_test/features/path_finding/domain/services/shortest_path_solver.dart';

BfsShortestPathSolver solver(DiagonalRule rule) =>
    BfsShortestPathSolver(movement: MovementPolicy(diagonalRule: rule));

PathSearchResult solve(
  List<String> rows,
  GridPoint start,
  GridPoint end, [
  DiagonalRule rule = DiagonalRule.atLeastOneSideOpen,
]) => solver(rule).solve(grid: Grid(rows), start: start, end: end);

// Independent adjacency oracle: does not call Grid or MovementPolicy.
bool oracleEdge(List<String> rows, int from, int to, DiagonalRule rule) {
  final n = rows.length;
  final x1 = from % n, y1 = from ~/ n;
  final x2 = to % n, y2 = to ~/ n;
  if (rows[y1][x1] != '.' || rows[y2][x2] != '.') return false;
  final dx = (x2 - x1).abs();
  final dy = (y2 - y1).abs();
  if (from == to || max(dx, dy) != 1) return false;
  if (dx * dy == 0) return true;
  final walls = (rows[y1][x2] == 'X' ? 1 : 0) + (rows[y2][x1] == 'X' ? 1 : 0);
  return walls <=
      switch (rule) {
        DiagonalRule.bothSidesOpen => 0,
        DiagonalRule.atLeastOneSideOpen => 1,
        DiagonalRule.destinationOnly => 2,
      };
}

const infinity = 1000000;

// Floyd-Warshall is intentionally different from the BFS being tested.
List<List<int>> oracleDistances(List<String> rows, DiagonalRule rule) {
  final count = rows.length * rows.length;
  final distances = List.generate(
    count,
    (a) => List.generate(count, (b) {
      if (a == b) return 0;
      return oracleEdge(rows, a, b, rule) ? 1 : infinity;
    }),
  );
  for (var k = 0; k < count; k++) {
    for (var i = 0; i < count; i++) {
      if (distances[i][k] == infinity) continue;
      for (var j = 0; j < count; j++) {
        distances[i][j] = min(
          distances[i][j],
          distances[i][k] + distances[k][j],
        );
      }
    }
  }
  return distances;
}

void verify(
  PathSearchResult result,
  List<String> rows,
  GridPoint start,
  GridPoint end,
  DiagonalRule rule,
  int distance,
) {
  if (distance == infinity) {
    expect(result, isA<UnreachablePath>());
    return;
  }
  expect(result, isA<FoundPath>());
  final path = result as FoundPath;
  expect(path.moveCount, distance);
  expect(path.steps.first, start);
  expect(path.steps.last, end);
  expect(path.steps.toSet().length, path.steps.length, reason: 'No cycles');
  for (var i = 0; i < path.steps.length; i++) {
    final p = path.steps[i];
    expect(p.x, inInclusiveRange(0, rows.length - 1));
    expect(p.y, inInclusiveRange(0, rows.length - 1));
    expect(rows[p.y][p.x], '.');
    if (i > 0) {
      final previous = path.steps[i - 1];
      expect(
        oracleEdge(
          rows,
          previous.y * rows.length + previous.x,
          p.y * rows.length + p.x,
          rule,
        ),
        isTrue,
        reason: '$previous -> $p must be a legal adjacent move',
      );
    }
  }
}

void main() {
  group('Data invariants', () {
    test('points have value equality and hash semantics', () {
      expect(const GridPoint(x: 1, y: 2), const GridPoint(x: 1, y: 2));
      expect(const GridPoint(x: 1, y: 2), isNot(const GridPoint(x: 2, y: 1)));
      final points = <GridPoint>{}
        ..add(const GridPoint(x: 1, y: 2))
        ..add(const GridPoint(x: 1, y: 2));
      expect(points, hasLength(1));
    });
    test('grid copies rows and prevents mutation', () {
      final input = ['..', '..'];
      final grid = Grid(input);
      input[0] = 'XX';
      expect(grid.isWalkable(const GridPoint(x: 0, y: 0)), isTrue);
      expect(() => grid.rows[0] = 'XX', throwsUnsupportedError);
    });
    test('result copies steps and prevents mutation', () {
      final points = [const GridPoint(x: 0, y: 0)];
      final result = FoundPath(points);
      points.clear();
      expect(result.steps, hasLength(1));
      expect(() => result.steps.clear(), throwsUnsupportedError);
      expect(() => FoundPath([]), throwsArgumentError);
    });
    test('rejects invalid size, non-square rows, and invalid characters', () {
      for (final rows in <List<String>>[
        [],
        ['.'],
        List.filled(100, '.' * 100),
        ['...', '..'],
        ['..', '...'],
        ['..', '.x'],
        ['..', '. '],
        ['..', '.\n'],
        ['..', '.і'],
      ]) {
        expect(() => Grid(rows), throwsArgumentError, reason: '$rows');
      }
    });
    test('rejects out-of-bounds and blocked endpoints even if identical', () {
      final grid = Grid(['.X', '..']);
      final instance = solver(DiagonalRule.atLeastOneSideOpen);
      for (final point in [
        const GridPoint(x: -1, y: 0),
        const GridPoint(x: 0, y: -1),
        const GridPoint(x: 2, y: 0),
        const GridPoint(x: 0, y: 2),
        const GridPoint(x: 1, y: 0),
      ]) {
        expect(
          () => instance.solve(
            grid: grid,
            start: point,
            end: const GridPoint(x: 0, y: 0),
          ),
          throwsArgumentError,
        );
        expect(
          () => instance.solve(
            grid: grid,
            start: const GridPoint(x: 0, y: 0),
            end: point,
          ),
          throwsArgumentError,
        );
        expect(
          () => instance.solve(grid: grid, start: point, end: point),
          throwsArgumentError,
        );
      }
    });
  });

  group('Movement and task fixtures', () {
    test('one step only; no stationary, blocked, or off-grid moves', () {
      final grid = Grid(['..X', '...', '...']);
      for (final rule in DiagonalRule.values) {
        final movement = MovementPolicy(diagonalRule: rule);
        for (final target in [
          const GridPoint(x: 0, y: 0),
          const GridPoint(x: 0, y: 2),
          const GridPoint(x: 2, y: 0),
          const GridPoint(x: -1, y: 0),
        ]) {
          expect(
            movement.canMove(grid, const GridPoint(x: 0, y: 0), target),
            isFalse,
          );
        }
        expect(
          movement.canMove(grid, const GridPoint(x: 2, y: 0), const GridPoint(x: 1, y: 0)),
          isFalse,
        );
      }
    });
    test('PDF example allows one blocked side', () {
      final result =
          solve(
                ['.X.', '.X.', '...'],
                const GridPoint(x: 1, y: 2),
                const GridPoint(x: 2, y: 0),
              )
              as FoundPath;
      expect(result.steps, [
        const GridPoint(x: 1, y: 2),
        const GridPoint(x: 2, y: 1),
        const GridPoint(x: 2, y: 0),
      ]);
    });
    test('first actual API task: two moves with one open side', () {
      final result =
          solve(
                ['.X.', '.X.', '...'],
                const GridPoint(x: 2, y: 1),
                const GridPoint(x: 0, y: 2),
              )
              as FoundPath;
      expect(result.steps, [
        const GridPoint(x: 2, y: 1),
        const GridPoint(x: 1, y: 2),
        const GridPoint(x: 0, y: 2),
      ]);
    });
    test('first API task needs three moves under strict corner rule', () {
      final result =
          solve(
                ['.X.', '.X.', '...'],
                const GridPoint(x: 2, y: 1),
                const GridPoint(x: 0, y: 2),
                DiagonalRule.bothSidesOpen,
              )
              as FoundPath;
      expect(result.moveCount, 3);
    });
    test('second API task: two walls trap start under no-squeezing rule', () {
      for (final rule in [
        DiagonalRule.bothSidesOpen,
        DiagonalRule.atLeastOneSideOpen,
      ]) {
        expect(
          solve(
            ['XXX.', 'X..X', 'X..X', '.XXX'],
            const GridPoint(x: 0, y: 3),
            const GridPoint(x: 3, y: 0),
            rule,
          ),
          isA<UnreachablePath>(),
        );
      }
    });
    test('second API task has three moves with destination-only rule', () {
      final result =
          solve(
                ['XXX.', 'X..X', 'X..X', '.XXX'],
                const GridPoint(x: 0, y: 3),
                const GridPoint(x: 3, y: 0),
                DiagonalRule.destinationOnly,
              )
              as FoundPath;
      expect(result.steps, [
        const GridPoint(x: 0, y: 3),
        const GridPoint(x: 1, y: 2),
        const GridPoint(x: 2, y: 1),
        const GridPoint(x: 3, y: 0),
      ]);
    });
    test('start equals end: one point, zero moves', () {
      for (final rule in DiagonalRule.values) {
        final path =
            solve(
                  ['..', '..'],
                  const GridPoint(x: 1, y: 1),
                  const GridPoint(x: 1, y: 1),
                  rule,
                )
                as FoundPath;
        expect(path.steps, [const GridPoint(x: 1, y: 1)]);
        expect(path.moveCount, 0);
      }
    });
    test('full wall separates valid endpoints', () {
      for (final rule in DiagonalRule.values) {
        expect(
          solve(
            ['...', 'XXX', '...'],
            const GridPoint(x: 0, y: 0),
            const GridPoint(x: 2, y: 2),
            rule,
          ),
          isA<UnreachablePath>(),
        );
      }
    });
    test('all eight directions are symmetric', () {
      final grid = Grid(['...', '...', '...']);
      for (final rule in DiagonalRule.values) {
        final movement = MovementPolicy(diagonalRule: rule);
        expect(movement.neighbors(grid, const GridPoint(x: 1, y: 1)).length, 8);
        for (final p in movement.neighbors(grid, const GridPoint(x: 1, y: 1))) {
          expect(movement.canMove(grid, p, const GridPoint(x: 1, y: 1)), isTrue);
        }
      }
    });
    test('repeated searches do not retain visited cells or parents', () {
      final instance = solver(DiagonalRule.atLeastOneSideOpen);
      final grid = Grid(['...', 'XXX', '...']);
      for (var i = 0; i < 5; i++) {
        expect(
          instance.solve(
            grid: grid,
            start: const GridPoint(x: 0, y: 0),
            end: const GridPoint(x: 2, y: 2),
          ),
          isA<UnreachablePath>(),
        );
        final path =
            instance.solve(
                  grid: grid,
                  start: const GridPoint(x: 2, y: 0),
                  end: const GridPoint(x: 0, y: 0),
                )
                as FoundPath;
        expect(path.steps, [
          const GridPoint(x: 2, y: 0),
          const GridPoint(x: 1, y: 0),
          const GridPoint(x: 0, y: 0),
        ]);
      }
    });
  });

  group('Exhaustive optimality: 34,800 endpoint pairs', () {
    for (final rule in DiagonalRule.values) {
      for (final n in [2, 3]) {
        test(
          '${n}x$n, all wall masks and all open endpoint pairs, ${rule.name}',
          () {
            var checked = 0;
            final instance = solver(rule);
            for (var mask = 0; mask < (1 << (n * n)); mask++) {
              final rows = List.generate(
                n,
                (y) => List.generate(
                  n,
                  (x) => mask & (1 << (y * n + x)) == 0 ? '.' : 'X',
                ).join(),
              );
              final distances = oracleDistances(rows, rule);
              final grid = Grid(rows);
              for (var a = 0; a < n * n; a++) {
                if (rows[a ~/ n][a % n] == 'X') continue;
                for (var b = 0; b < n * n; b++) {
                  if (rows[b ~/ n][b % n] == 'X') continue;
                  final start = GridPoint(x: a % n, y: a ~/ n);
                  final end = GridPoint(x: b % n, y: b ~/ n);
                  verify(
                    instance.solve(grid: grid, start: start, end: end),
                    rows,
                    start,
                    end,
                    rule,
                    distances[a][b],
                  );
                  checked++;
                }
              }
            }
            expect(checked, n == 2 ? 80 : 11520);
          },
        );
      }
    }
  });
}
