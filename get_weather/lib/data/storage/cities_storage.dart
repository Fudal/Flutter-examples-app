import 'package:get_weather/domain/app/capabilities/city_item.dart';

abstract class CitiesStorage {
  Future<List<CityItem>> loadUserCities();

  Future<void> saveUserCities(List<CityItem> cities);
}
