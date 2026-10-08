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
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:webspark_test/core/di/network_module.dart' as _i1069;
import 'package:webspark_test/core/di/storage_module.dart' as _i706;
import 'package:webspark_test/features/path_finding/data/api/path_finding_api.dart'
    as _i635;
import 'package:webspark_test/features/path_finding/data/datasources/api_url_local_data_source.dart'
    as _i179;
import 'package:webspark_test/features/path_finding/data/datasources/preferences_api_url_local_data_source.dart'
    as _i336;
import 'package:webspark_test/features/path_finding/data/repositories/api_url_repository_impl.dart'
    as _i752;
import 'package:webspark_test/features/path_finding/data/repositories/path_finding_repository_impl.dart'
    as _i107;
import 'package:webspark_test/features/path_finding/di/path_finding_module.dart'
    as _i475;
import 'package:webspark_test/features/path_finding/domain/repositories/api_url_repository.dart'
    as _i364;
import 'package:webspark_test/features/path_finding/domain/repositories/path_finding_repository.dart'
    as _i86;
import 'package:webspark_test/features/path_finding/domain/services/movement_policy.dart'
    as _i991;
import 'package:webspark_test/features/path_finding/domain/services/shortest_path_solver.dart'
    as _i1018;
import 'package:webspark_test/features/path_finding/domain/use_cases/calculate_paths_use_case.dart'
    as _i913;
import 'package:webspark_test/features/path_finding/domain/use_cases/get_path_tasks_use_case.dart'
    as _i24;
import 'package:webspark_test/features/path_finding/domain/use_cases/get_saved_api_url_use_case.dart'
    as _i275;
import 'package:webspark_test/features/path_finding/domain/use_cases/save_api_url_use_case.dart'
    as _i46;
import 'package:webspark_test/features/path_finding/domain/use_cases/send_results_use_case.dart'
    as _i167;
import 'package:webspark_test/features/path_finding/presentation/state/processing/processing_cubit.dart'
    as _i25;
import 'package:webspark_test/features/path_finding/presentation/state/url_input/url_input_cubit.dart'
    as _i366;
import 'package:webspark_test/features/path_finding/presentation/validators/api_url_validator.dart'
    as _i1061;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    final storageModule = _$StorageModule();
    final pathFindingModule = _$PathFindingModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i460.SharedPreferencesAsync>(
      () => storageModule.sharedPreferencesAsync,
    );
    gh.lazySingleton<_i991.MovementPolicy>(
      () => pathFindingModule.movementPolicy,
    );
    gh.lazySingleton<_i1061.ApiUrlValidator>(
      () => const _i1061.ApiUrlValidator(),
    );
    gh.lazySingleton<_i1018.ShortestPathSolver>(
      () => pathFindingModule.shortestPathSolver(gh<_i991.MovementPolicy>()),
    );
    gh.lazySingleton<_i86.PathFindingRepository>(
      () => _i107.PathFindingRepositoryImpl(),
    );
    gh.lazySingleton<_i179.ApiUrlLocalDataSource>(
      () => _i336.PreferencesApiUrlLocalDataSource(
        gh<_i460.SharedPreferencesAsync>(),
      ),
    );
    gh.factory<_i913.CalculatePathsUseCase>(
      () => _i913.CalculatePathsUseCase(gh<_i1018.ShortestPathSolver>()),
    );
    gh.factoryParam<_i635.PathFindingApi, String?, dynamic>(
      (baseUrl, _) => _i635.PathFindingApi(gh<_i361.Dio>(), baseUrl: baseUrl),
    );
    gh.lazySingleton<_i24.GetPathTasksUseCase>(
      () => _i24.GetPathTasksUseCase(gh<_i86.PathFindingRepository>()),
    );
    gh.factory<_i167.SendResultsUseCase>(
      () => _i167.SendResultsUseCase(gh<_i86.PathFindingRepository>()),
    );
    gh.lazySingleton<_i364.ApiUrlRepository>(
      () => _i752.ApiUrlRepositoryImpl(gh<_i179.ApiUrlLocalDataSource>()),
    );
    gh.factory<_i25.ProcessingCubit>(
      () => _i25.ProcessingCubit(
        gh<_i24.GetPathTasksUseCase>(),
        gh<_i913.CalculatePathsUseCase>(),
        gh<_i167.SendResultsUseCase>(),
      ),
    );
    gh.factory<_i275.GetSavedApiUrlUseCase>(
      () => _i275.GetSavedApiUrlUseCase(gh<_i364.ApiUrlRepository>()),
    );
    gh.factory<_i46.SaveApiUrlUseCase>(
      () => _i46.SaveApiUrlUseCase(gh<_i364.ApiUrlRepository>()),
    );
    gh.factory<_i366.UrlInputCubit>(
      () => _i366.UrlInputCubit(
        gh<_i275.GetSavedApiUrlUseCase>(),
        gh<_i46.SaveApiUrlUseCase>(),
        gh<_i1061.ApiUrlValidator>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i1069.NetworkModule {}

class _$StorageModule extends _i706.StorageModule {}

class _$PathFindingModule extends _i475.PathFindingModule {}
