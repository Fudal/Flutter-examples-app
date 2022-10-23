//ignore_for_file: constant_identifier_names
import 'package:get_weather/data/hive/hive_city_item.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

const String BOX_CITIES_ITEMS = "userCities";

@module
abstract class StorageModule {
  @lazySingleton
  Box<HiveCityItem> userCitiesBox() {
    return Hive.box<HiveCityItem>(BOX_CITIES_ITEMS);
  }
}
