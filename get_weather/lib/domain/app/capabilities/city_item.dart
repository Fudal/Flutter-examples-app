import 'package:get_weather/domain/app/capabilities/weather_item.dart';

class CityItem {
  final String? cityName;
  final double? latitude;
  final double? longitude;
  final WeatherItem? currentWeather;
  final List<WeatherItem>? forecastWeather;
  final bool? isFavorite;

  CityItem({
    this.cityName,
    this.latitude,
    this.longitude,
    this.currentWeather,
    this.forecastWeather,
    this.isFavorite,
  });

  CityItem copyWith({
    String? cityName,
    double? latitude,
    double? longitude,
    WeatherItem? currentWeather,
    List<WeatherItem>? forecastWeather,
    bool? isFavorite,
  }) {
    return CityItem(
      cityName: cityName ?? this.cityName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      currentWeather: currentWeather ?? this.currentWeather,
      forecastWeather: forecastWeather ?? this.forecastWeather,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
