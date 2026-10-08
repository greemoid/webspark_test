import 'package:injectable/injectable.dart';
import 'package:webspark_test/features/path_finding/domain/services/movement_policy.dart';
import 'package:webspark_test/features/path_finding/domain/services/shortest_path_solver.dart';

@module
abstract class PathFindingModule {
  @lazySingleton
  MovementPolicy get movementPolicy => const MovementPolicy(
        diagonalRule: DiagonalRule.destinationOnly,
      );

  @lazySingleton
  ShortestPathSolver shortestPathSolver(MovementPolicy movement) =>
      BfsShortestPathSolver(movement: movement);
}
