import 'package:get_weather/data/network/response/weather_current_response.dart';
import 'package:get_weather/data/network/response/weather_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_details_response.g.dart';

@JsonSerializable()
class CityDetailsResponse {
  final WeatherCurrentResponse? current;
  final List<WeatherResponse>? daily;

  CityDetailsResponse({
    this.current,
    this.daily,
  });

  factory CityDetailsResponse.fromJson(Map<String, dynamic> json) => _$CityDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityDetailsResponseToJson(this);
}
