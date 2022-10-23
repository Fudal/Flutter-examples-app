// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app_initializers/app_initializer.dart' as _i5;
import '../app_initializers/localization_initializer.dart' as _i3;
import '../data/network/repository/movies_repository.dart' as _i7;
import '../data/network/service/api_network_service.dart' as _i6;
import '../domain/app_services/app_service.dart' as _i8;
import '../domain/app_services/application_service.dart' as _i9;
import '../domain/use_cases/get_movie_use_case.dart' as _i10;
import '../pages/movie_details/movie_details_cubit.dart' as _i11;
import '../pages/movie_list/movie_list_cubit.dart' as _i12;
import 'initializer_module.dart' as _i13;
import 'network_module.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final initializerModule = _$InitializerModule();
  final networkModule = _$NetworkModule();
  gh.factory<_i3.LocalizationInitializer>(
      () => initializerModule.localizationInitializer());
  gh.factory<String>(() => networkModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i4.Dio>(
      () => networkModule.dioInitializer(get<String>(instanceName: 'BaseUrl')));
  gh.factory<List<_i5.AppInitializer>>(
      () => initializerModule.initializers(get<_i3.LocalizationInitializer>()));
  gh.singleton<_i6.ApiNetworkService>(_i6.ApiNetworkService(get<_i4.Dio>()));
  gh.factory<_i5.AppInitializer>(
      () => initializerModule.container(get<List<_i5.AppInitializer>>()));
  gh.lazySingleton<_i7.AppMoviesRepository>(
      () => _i7.AppMoviesRepositoryImpl(get<_i6.ApiNetworkService>()));
  gh.factory<_i8.AppService>(
      () => _i8.AppService(get<_i7.AppMoviesRepository>()));
  gh.lazySingleton<_i9.AppApi>(
      () => _i9.AppApplicationService(get<_i8.AppService>()));
  gh.factory<_i10.GetMoviesUseCase>(
      () => _i10.GetMoviesUseCase(get<_i9.AppApi>()));
  gh.factory<_i11.MovieDetailsCubit>(
      () => _i11.MovieDetailsCubit(get<_i9.AppApi>()));
  gh.factory<_i12.MovieListCubit>(
      () => _i12.MovieListCubit(get<_i10.GetMoviesUseCase>()));
  return get;
}

class _$InitializerModule extends _i13.InitializerModule {}

class _$NetworkModule extends _i14.NetworkModule {}
