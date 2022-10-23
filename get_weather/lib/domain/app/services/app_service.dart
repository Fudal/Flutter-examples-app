import 'dart:io';

import 'package:get_weather/data/network/exceptions/network_exceptions.dart';
import 'package:get_weather/data/network/repository/weather_repository.dart';
import 'package:get_weather/domain/app/capabilities/city_item.dart';
import 'package:get_weather/domain/base/errors/connection_exception.dart';
import 'package:get_weather/domain/base/errors/network_exception.dart';
import 'package:get_weather/domain/base/errors/server_exception.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppService {
  final AppWeatherRepository _appWeatherRepository;

  AppService(this._appWeatherRepository);

  Future<CityItem> getCity(String cityName) async {
    try {
      return await _appWeatherRepository.getCity(cityName);
    } catch (exc) {
      if (exc is ServiceUnavailable) {
        throw ServerException(exc.message);
      } else if (exc is ServerError) {
        throw ServerException(exc.message);
      } else if (exc is NetworkError) {
        throw NetworkException(exc.message);
      } else if (exc is SocketException) {
        throw ConnectionException(exc.message);
      } else {
        rethrow;
      }
    }
  }

  Future<CityItem> getCityDetails({
    required double lat,
    required double lon,
  }) async {
    try {
      return await _appWeatherRepository.getCityDetails(
        lon: lon,
        lat: lat,
      );
    } catch (exc) {
      if (exc is ServiceUnavailable) {
        throw ServerException(exc.message);
      } else if (exc is ServerError) {
        throw ServerException(exc.message);
      } else if (exc is NetworkError) {
        throw NetworkException(exc.message);
      } else if (exc is SocketException) {
        throw ConnectionException(exc.message);
      } else {
        rethrow;
      }
    }
  }
}
