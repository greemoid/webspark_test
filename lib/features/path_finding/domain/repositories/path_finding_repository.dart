import 'package:fpdart/fpdart.dart';
import 'package:webspark_test/core/cubits/base/failure.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_task.dart';

abstract class PathFindingRepository {
  Future<Either<Failure, List<PathTask>>> getTasks(String url);
  Future<Either<Failure, bool>> submitResults(
    String url,
    List<PathResult> results,
  );
}
