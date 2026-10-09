import 'package:fpdart/fpdart.dart';
import 'package:webspark_test/core/failure/failure.dart';

abstract interface class ApiUrlRepository {
  Future<Either<Failure, String?>> getSavedUrl();
  Future<Either<Failure, Unit>> saveUrl(String url);
}
