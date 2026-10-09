import 'package:fpdart/fpdart.dart';
import 'package:webspark_test/core/failure/failure_mapper.dart';
import 'package:webspark_test/core/failure/failure.dart';

mixin EitherGuardMixin {
  Future<Either<Failure, T>> guard<T>(Future<T> Function() computation) async {
    try {
      final result = await computation();
      return right(result);
    } catch (e) {
      return left(FailureMapper.from(e));
    }
  }
}
