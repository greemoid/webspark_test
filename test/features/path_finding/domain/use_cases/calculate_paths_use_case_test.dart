import 'package:flutter_test/flutter_test.dart';
import 'package:webspark_test/features/path_finding/domain/entities/grid_point.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_task.dart';
import 'package:webspark_test/features/path_finding/domain/services/movement_policy.dart';
import 'package:webspark_test/features/path_finding/domain/services/shortest_path_solver.dart';
import 'package:webspark_test/features/path_finding/domain/use_cases/calculate_paths_use_case.dart';

void main() {
  late CalculatePathsUseCase useCase;
  late ShortestPathSolver solver;

  setUp(() {
    solver = BfsShortestPathSolver(
      movement: const MovementPolicy(
        diagonalRule: DiagonalRule.destinationOnly,
      ),
    );
    useCase = CalculatePathsUseCase(solver);
  });

  group('CalculatePathsUseCase', () {
    test(
      'should calculate valid paths successfully and report progress',
      () async {
        final tasks = [
          const PathTask(
            id: 'task1',
            field: ['.X.', '.X.', '...'],
            start: GridPoint(x: 2, y: 1),
            end: GridPoint(x: 0, y: 2),
          ),
          const PathTask(
            id: 'task2',
            field: ['XXX.', 'X..X', 'X..X', '.XXX'],
            start: GridPoint(x: 0, y: 3),
            end: GridPoint(x: 3, y: 0),
          ),
        ];

        final progresses = <(int, int)>[];

        final result = await useCase(
          CalculatePathsParams(
            tasks: tasks,
            onProgress: (completed, total) {
              progresses.add((completed, total));
            },
          ),
        );

        expect(result.isRight(), isTrue);

        final results = result.getOrElse((_) => []);
        expect(results.length, 2);

        expect(results[0].id, 'task1');
        expect(results[0].path, '(2,1)->(1,2)->(0,2)');
        expect(results[0].field, ['.X.', '.X.', '...']);

        expect(results[1].id, 'task2');
        expect(results[1].path, '(0,3)->(1,2)->(2,1)->(3,0)');
        expect(results[1].field, ['XXX.', 'X..X', 'X..X', '.XXX']);

        expect(progresses, [(1, 2), (2, 2)]);
      },
    );

    test('should handle unreachable paths correctly', () async {
      final tasks = [
        const PathTask(
          id: 'task1',
          field: ['...', 'XXX', '...'],
          start: GridPoint(x: 0, y: 0),
          end: GridPoint(x: 2, y: 2),
        ),
      ];

      final result = await useCase(CalculatePathsParams(tasks: tasks));

      expect(result.isRight(), isTrue);
      final results = result.getOrElse((_) => []);
      expect(results.length, 1);
      expect(results[0].path, '');
      expect(results[0].steps, isEmpty);
    });
  });
}
