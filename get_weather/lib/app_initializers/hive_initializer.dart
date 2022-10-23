import 'package:get_weather/app_initializers/app_initializer.dart';
import 'package:get_weather/data/hive/hive_city_item.dart';
import 'package:get_weather/injections/storage_module.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInitializer extends AppInitializer {
  @override
  Future<void> init() async {
    await Hive.initFlutter();

    final city = HiveCityItemAdapter();

    if (!Hive.isAdapterRegistered(city.typeId)) {
      Hive.registerAdapter(city);

      await Hive.openBox<HiveCityItem>(BOX_CITIES_ITEMS);
    }
  }
}
