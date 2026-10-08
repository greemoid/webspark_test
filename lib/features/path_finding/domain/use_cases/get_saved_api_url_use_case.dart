import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:webspark_test/core/cubits/base/failure.dart';
import 'package:webspark_test/core/use_cases/use_case.dart';
import 'package:webspark_test/features/path_finding/domain/repositories/api_url_repository.dart';

@injectable
class GetSavedApiUrlUseCase implements UseCase<String?, NoParams> {
  const GetSavedApiUrlUseCase(this._repository);

  final ApiUrlRepository _repository;

  @override
  Future<Either<Failure, String?>> call(NoParams params) {
    return _repository.getSavedUrl();
  }
}
