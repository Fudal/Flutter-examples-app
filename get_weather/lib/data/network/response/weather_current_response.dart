import 'package:json_annotation/json_annotation.dart';

part 'weather_current_response.g.dart';

@JsonSerializable()
class WeatherCurrentResponse {
  final int? dt;
  final double? pressure;
  final double? humidity;
  @JsonKey(name: "wind_speed")
  final double? windSpeed;
  final double? temp;

  WeatherCurrentResponse({
    this.dt,
    this.pressure,
    this.humidity,
    this.windSpeed,
    this.temp,
  });

  factory WeatherCurrentResponse.fromJson(Map<String, dynamic> json) => _$WeatherCurrentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCurrentResponseToJson(this);
}
