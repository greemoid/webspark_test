import 'package:fpdart/fpdart.dart';
import 'package:webspark_test/core/cubits/base/failure.dart';

abstract interface class UseCase<Result, Params> {
  Future<Either<Failure, Result>> call(Params params);
}

final class NoParams {
  const NoParams();
}
