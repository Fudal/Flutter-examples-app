import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  final int? dt;
  final double? pressure;
  final double? humidity;
  @JsonKey(name: "wind_speed")
  final double? windSpeed;
  final TempResponse? temp;

  WeatherResponse({
    this.dt,
    this.pressure,
    this.humidity,
    this.windSpeed,
    this.temp,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

@JsonSerializable()
class TempResponse {
  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? eve;
  final double? morn;

  TempResponse({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  factory TempResponse.fromJson(Map<String, dynamic> json) => _$TempResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TempResponseToJson(this);
}
