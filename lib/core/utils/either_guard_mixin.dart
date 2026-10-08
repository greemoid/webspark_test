import 'package:fpdart/fpdart.dart';
import 'package:webspark_test/core/cubits/base/failure_mapper.dart';
import 'package:webspark_test/core/cubits/base/failure.dart';

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
