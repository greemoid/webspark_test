import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:webspark_test/core/cubits/base/failure.dart';
import 'package:webspark_test/core/use_cases/use_case.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_task.dart';
import 'package:webspark_test/features/path_finding/domain/services/grid.dart';
import 'package:webspark_test/features/path_finding/domain/services/path_search_result.dart';
import 'package:webspark_test/features/path_finding/domain/services/shortest_path_solver.dart';

class CalculatePathsParams {
  const CalculatePathsParams({required this.tasks, this.onProgress});

  final List<PathTask> tasks;
  final void Function(int completed, int total)? onProgress;
}

@injectable
class CalculatePathsUseCase
    implements UseCase<List<PathResult>, CalculatePathsParams> {
  const CalculatePathsUseCase(this._solver);

  final ShortestPathSolver _solver;

  @override
  Future<Either<Failure, List<PathResult>>> call(
    CalculatePathsParams params,
  ) async {
    try {
      final results = <PathResult>[];
      final total = params.tasks.length;

      for (var i = 0; i < total; i++) {
        final task = params.tasks[i];

        final grid = Grid(task.field);

        final searchResult = _solver.solve(
          grid: grid,
          start: task.start,
          end: task.end,
        );

        String pathString = '';
        if (searchResult is FoundPath) {
          pathString = searchResult.steps
              .map((e) => '(${e.x},${e.y})')
              .join('->');
          results.add(
            PathResult(
              id: task.id,
              steps: searchResult.steps.toList(),
              path: pathString,
              field: task.field,
            ),
          );
        } else if (searchResult is UnreachablePath) {
          results.add(
            PathResult(id: task.id, steps: [], path: '', field: task.field),
          );
        }

        params.onProgress?.call(i + 1, total);

        // yield control to the event loop so UI can update progress
        await Future.delayed(Duration.zero);
      }

      return Right(results);
    } catch (e) {
      return Left(CalculationFailure('Failed to calculate paths: $e'));
    }
  }
}
