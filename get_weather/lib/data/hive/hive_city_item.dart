import 'package:get_weather/data/config/hive_config.dart';
import 'package:hive/hive.dart';

part 'hive_city_item.g.dart';

@HiveType(typeId: HiveConfig.USER_CITIES_TYPE_ID)
class HiveCityItem {
  @HiveField(0)
  String? cityName;

  @HiveField(1)
  double? latitude;

  @HiveField(2)
  double? longitude;

  @HiveField(3)
  double? windSpeed;

  @HiveField(4)
  double? temp;

  @HiveField(5)
  bool? isFavorite;

  HiveCityItem({
    this.cityName,
    this.latitude,
    this.longitude,
    this.windSpeed,
    this.isFavorite,
    this.temp,
  });
}
