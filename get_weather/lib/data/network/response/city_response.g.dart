// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) => CityResponse(
      cityName: json['name'] as String?,
      coord: json['coord'] == null
          ? null
          : CoordinatesResponse.fromJson(json['coord'] as Map<String, dynamic>),
      main: json['main'] == null
          ? null
          : CityWeatherResponse.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityResponseToJson(CityResponse instance) =>
    <String, dynamic>{
      'name': instance.cityName,
      'coord': instance.coord,
      'main': instance.main,
    };

CoordinatesResponse _$CoordinatesResponseFromJson(Map<String, dynamic> json) =>
    CoordinatesResponse(
      latitude: (json['lat'] as num?)?.toDouble(),
      longitude: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesResponseToJson(
        CoordinatesResponse instance) =>
    <String, dynamic>{
      'lat': instance.latitude,
      'lon': instance.longitude,
    };

CityWeatherResponse _$CityWeatherResponseFromJson(Map<String, dynamic> json) =>
    CityWeatherResponse(
      temp: (json['temp'] as num?)?.toDouble(),
      pressure: (json['pressure'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CityWeatherResponseToJson(
        CityWeatherResponse instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
