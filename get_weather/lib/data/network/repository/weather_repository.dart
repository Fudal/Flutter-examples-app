import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_weather/data/network/service/api_network_service.dart';
import 'package:get_weather/domain/app/capabilities/city_item.dart';
import 'package:get_weather/domain/app/capabilities/weather_item.dart';
import 'package:get_weather/domain/base/errors/city_not_found_exception.dart';
import 'package:get_weather/domain/repository_constants.dart';

abstract class AppWeatherRepository {
  Future<CityItem> getCity(String cityName);
  Future<CityItem> getCityDetails({
    required double lat,
    required double lon,
  });
}

class AppWeatherRepositoryImpl implements AppWeatherRepository {
  final ApiNetworkService _apiNetworkService;

  AppWeatherRepositoryImpl(this._apiNetworkService);

  @override
  Future<CityItem> getCity(String cityName) async {
    try {
      final result = await _apiNetworkService.getCity(
        appId: RepositoryConstants.apiKey,
        cityName: cityName,
      );
      return CityItem(
        cityName: result.cityName,
        longitude: result.coord?.longitude,
        latitude: result.coord?.latitude,
        currentWeather: WeatherItem(
          temp: result.main?.temp,
          humidity: result.main?.humidity,
          pressure: result.main?.pressure,
        ),
      );
    } on DioError catch (exc) {
      if (exc.response?.statusCode == 404) {
        throw CityNotFoundException;
      } else {
        throw exc.error as Object;
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
  @override
  Future<CityItem> getCityDetails({
    required double lat,
    required double lon,
  }) async {
    try {
      final result = await _apiNetworkService.getCityDetails(
        appId: RepositoryConstants.apiKey,
        lat: lat,
        lon: lon,
      );

      return CityItem(
        currentWeather: WeatherItem(
          pressure: result.current?.pressure,
          humidity: result.current?.humidity,
          temp: result.current?.temp,
          windSpeed: result.current?.windSpeed,
        ),
        forecastWeather: result.daily?.skip(1).map((e) => WeatherItem(
          pressure: e.pressure,
          humidity: e.humidity,
          temp: e.temp?.day,
          windSpeed: e.windSpeed,
          date: _parseDate(e.dt),
        ),).toList(),
      );
    } on DioError catch (exc) {
      throw exc.error as Object;
    } on SocketException catch (_) {
      rethrow;
    }
  }

  DateTime? _parseDate(int? timestamp) {
    if (timestamp != null) {
      return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    }
    return null;
  }
}
