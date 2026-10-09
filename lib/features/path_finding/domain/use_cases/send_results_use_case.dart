import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:webspark_test/core/failure/failure.dart';
import 'package:webspark_test/core/use_cases/use_case.dart';
import 'package:webspark_test/features/path_finding/domain/entities/path_result.dart';
import 'package:webspark_test/features/path_finding/domain/repositories/path_finding_repository.dart';

class SendResultsParams {
  const SendResultsParams({required this.url, required this.results});

  final String url;
  final List<PathResult> results;
}

@injectable
class SendResultsUseCase implements UseCase<bool, SendResultsParams> {
  const SendResultsUseCase(this._repository);

  final PathFindingRepository _repository;

  @override
  Future<Either<Failure, bool>> call(SendResultsParams params) {
    return _repository.submitResults(params.url, params.results);
  }
}
