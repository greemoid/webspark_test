import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:webspark_test/core/cubits/base/failure.dart';
import 'package:webspark_test/core/di/locator.dart';
import 'package:webspark_test/core/utils/either_guard_mixin.dart';
import 'package:webspark_test/features/path_finding/data/api/path_finding_api.dart';
import 'package:webspark_test/features/path_finding/data/mappers/path_finding_mappers.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_task.dart';
import 'package:webspark_test/features/path_finding/domain/repositories/path_finding_repository.dart';

@LazySingleton(as: PathFindingRepository)
class PathFindingRepositoryImpl
    with EitherGuardMixin
    implements PathFindingRepository {
  PathFindingRepositoryImpl();

  @override
  Future<Either<Failure, List<PathTask>>> getTasks(String url) =>
      guard(() async {
        final api = locator<PathFindingApi>(param1: url);
        final response = await api.getTasks();
        if (response.error) {
          throw const ServerFailure();
        }
        return response.data.map((dto) => dto.toDomain()).toList();
      });

  @override
  Future<Either<Failure, bool>> submitResults(
    String url,
    List<PathResult> results,
  ) => guard(() async {
    final api = locator<PathFindingApi>(param1: url);
    final requestBody = results.map((r) => r.toDto()).toList();
    final response = await api.submitResults(requestBody);

    if (response.error) {
      throw const ServerFailure();
    }

    return response.data.every((element) => element.correct);
  });
}
