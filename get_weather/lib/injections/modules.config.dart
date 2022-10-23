// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../app_initializers/app_initializer.dart' as _i10;
import '../app_initializers/hive_initializer.dart' as _i6;
import '../app_initializers/localization_initializer.dart' as _i8;
import '../data/hive/hive_cities_storage.dart' as _i18;
import '../data/hive/hive_city_item.dart' as _i4;
import '../data/network/repository/weather_repository.dart' as _i12;
import '../data/network/service/api_network_service.dart' as _i11;
import '../data/storage/cities_storage.dart' as _i5;
import '../domain/app/services/app_service.dart' as _i13;
import '../presentation/city_details/city_details_cubit.dart' as _i14;
import '../presentation/city_form/city_form_cubit.dart' as _i15;
import '../presentation/home/home_cubit.dart' as _i7;
import 'initializer_module.dart' as _i19;
import 'network_module.dart' as _i20;
import 'repository_module.dart' as _i17;
import 'storage_module.dart' as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final storageModule = _$StorageModule();
  final repositoriesModule = _$RepositoriesModule(get);
  final initializerModule = _$InitializerModule();
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.Box<_i4.HiveCityItem>>(
      () => storageModule.userCitiesBox());
  gh.lazySingleton<_i5.CitiesStorage>(() => repositoriesModule.citiesStorage);
  gh.factory<_i6.HiveInitializer>(() => initializerModule.hiveInitializer());
  gh.factory<_i7.HomeCubit>(() => _i7.HomeCubit(get<_i5.CitiesStorage>()));
  gh.factory<_i8.LocalizationInitializer>(
      () => initializerModule.localizationInitializer());
  gh.factory<String>(() => networkModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i9.Dio>(
      () => networkModule.dioInitializer(get<String>(instanceName: 'BaseUrl')));
  gh.factory<List<_i10.AppInitializer>>(() => initializerModule.initializers(
      get<_i8.LocalizationInitializer>(), get<_i6.HiveInitializer>()));
  gh.singleton<_i11.ApiNetworkService>(_i11.ApiNetworkService(get<_i9.Dio>()));
  gh.factory<_i10.AppInitializer>(
      () => initializerModule.container(get<List<_i10.AppInitializer>>()));
  gh.lazySingleton<_i12.AppWeatherRepository>(
      () => repositoriesModule.appWeatherRepository);
  gh.factory<_i13.AppService>(
      () => _i13.AppService(get<_i12.AppWeatherRepository>()));
  gh.factory<_i14.CityDetailsCubit>(
      () => _i14.CityDetailsCubit(get<_i13.AppService>()));
  gh.factory<_i15.CityFormCubit>(
      () => _i15.CityFormCubit(get<_i13.AppService>()));
  return get;
}

class _$StorageModule extends _i16.StorageModule {}

class _$RepositoriesModule extends _i17.RepositoriesModule {
  _$RepositoriesModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i18.HiveCitiesStorage get citiesStorage =>
      _i18.HiveCitiesStorage(_getIt<_i3.Box<_i4.HiveCityItem>>());
  @override
  _i12.AppWeatherRepositoryImpl get appWeatherRepository =>
      _i12.AppWeatherRepositoryImpl(_getIt<_i11.ApiNetworkService>());
}

class _$InitializerModule extends _i19.InitializerModule {}

class _$NetworkModule extends _i20.NetworkModule {}
