// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityDetailsResponse _$CityDetailsResponseFromJson(Map<String, dynamic> json) =>
    CityDetailsResponse(
      current: json['current'] == null
          ? null
          : WeatherCurrentResponse.fromJson(
              json['current'] as Map<String, dynamic>),
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => WeatherResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityDetailsResponseToJson(
        CityDetailsResponse instance) =>
    <String, dynamic>{
      'current': instance.current,
      'daily': instance.daily,
    };
