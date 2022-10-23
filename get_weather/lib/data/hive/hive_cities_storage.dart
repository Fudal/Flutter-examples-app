import 'package:get_weather/data/hive/hive_city_item.dart';
import 'package:get_weather/data/storage/cities_storage.dart';
import 'package:get_weather/domain/app/capabilities/city_item.dart';
import 'package:get_weather/domain/app/capabilities/weather_item.dart';
import 'package:hive/hive.dart';

class HiveCitiesStorage extends CitiesStorage {
  final Box<HiveCityItem> box;

  HiveCitiesStorage(this.box);

  @override
  Future<List<CityItem>> loadUserCities() async {
    final List<HiveCityItem> saved = box.values.toList();

    final List<CityItem> cities = saved.map((e) => CityItem(
      latitude: e.latitude,
      longitude: e.longitude,
      cityName: e.cityName,
      isFavorite: e.isFavorite,
      currentWeather: WeatherItem(
        temp: e.temp,
      ),
    ),).toList();

    return cities;
  }

  @override
  Future<void> saveUserCities(List<CityItem> cities) async {
    final List<HiveCityItem> citiesList = cities.map((e) => HiveCityItem(
      longitude: e.longitude,
      temp: e.currentWeather?.temp,
      isFavorite: e.isFavorite,
      cityName: e.cityName,
      latitude: e.latitude,
    ),).toList();

    await box.clear();
    await box.addAll(citiesList);
  }
}
