import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:webspark_test/core/failure/failure.dart';
import 'package:webspark_test/core/use_cases/use_case.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_task.dart';
import 'package:webspark_test/features/path_finding/domain/repositories/path_finding_repository.dart';

@lazySingleton
class GetPathTasksUseCase implements UseCase<List<PathTask>, String> {
  const GetPathTasksUseCase(this._repository);

  final PathFindingRepository _repository;

  @override
  Future<Either<Failure, List<PathTask>>> call(String url) {
    return _repository.getTasks(url);
  }
}
