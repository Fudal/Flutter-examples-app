// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_current_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCurrentResponse _$WeatherCurrentResponseFromJson(
        Map<String, dynamic> json) =>
    WeatherCurrentResponse(
      dt: json['dt'] as int?,
      pressure: (json['pressure'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      temp: (json['temp'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherCurrentResponseToJson(
        WeatherCurrentResponse instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'wind_speed': instance.windSpeed,
      'temp': instance.temp,
    };
