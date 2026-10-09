import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:webspark_test/core/failure/failure.dart';
import 'package:webspark_test/core/utils/either_guard_mixin.dart';
import 'package:webspark_test/features/path_finding/data/datasources/api_url_local_data_source.dart';
import 'package:webspark_test/features/path_finding/domain/repositories/api_url_repository.dart';

@LazySingleton(as: ApiUrlRepository)
class ApiUrlRepositoryImpl with EitherGuardMixin implements ApiUrlRepository {
  const ApiUrlRepositoryImpl(this._dataSource);

  final ApiUrlLocalDataSource _dataSource;

  @override
  Future<Either<Failure, String?>> getSavedUrl() {
    return guard(() => _dataSource.getUrl());
  }

  @override
  Future<Either<Failure, Unit>> saveUrl(String url) {
    return guard(() async {
      await _dataSource.saveUrl(url);
      return unit;
    });
  }
}
