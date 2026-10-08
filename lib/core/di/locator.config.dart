// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:webspark_test/core/di/network_module.dart' as _i1069;
import 'package:webspark_test/features/path_finding/data/api/path_finding_api.dart'
    as _i635;
import 'package:webspark_test/features/path_finding/data/repositories/path_finding_repository_impl.dart'
    as _i107;
import 'package:webspark_test/features/path_finding/domain/repositories/path_finding_repository.dart'
    as _i86;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i86.PathFindingRepository>(
      () => _i107.PathFindingRepositoryImpl(),
    );
    gh.factoryParam<_i635.PathFindingApi, String?, dynamic>(
      (baseUrl, _) => _i635.PathFindingApi(gh<_i361.Dio>(), baseUrl: baseUrl),
    );
    return this;
  }
}

class _$NetworkModule extends _i1069.NetworkModule {}
