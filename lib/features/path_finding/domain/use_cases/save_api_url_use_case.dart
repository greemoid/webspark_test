import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:webspark_test/core/failure/failure.dart';
import 'package:webspark_test/core/use_cases/use_case.dart';
import 'package:webspark_test/features/path_finding/domain/repositories/api_url_repository.dart';

@injectable
class SaveApiUrlUseCase implements UseCase<Unit, String> {
  const SaveApiUrlUseCase(this._repository);

  final ApiUrlRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(String url) {
    return _repository.saveUrl(url);
  }
}
