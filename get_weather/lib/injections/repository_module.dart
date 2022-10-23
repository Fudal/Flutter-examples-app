import 'package:get_weather/data/hive/hive_cities_storage.dart';
import 'package:get_weather/data/network/repository/weather_repository.dart';
import 'package:get_weather/data/storage/cities_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoriesModule {
  @LazySingleton(as: CitiesStorage)
  HiveCitiesStorage get citiesStorage;

  @LazySingleton(as: AppWeatherRepository)
  AppWeatherRepositoryImpl get appWeatherRepository;
}
