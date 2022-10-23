import 'package:json_annotation/json_annotation.dart';

part 'city_response.g.dart';

@JsonSerializable()
class CityResponse {
  @JsonKey(name: "name")
  final String? cityName;
  final CoordinatesResponse? coord;
  final CityWeatherResponse? main;

  CityResponse({
    this.cityName,
    this.coord,
    this.main,
  });

  factory CityResponse.fromJson(Map<String, dynamic> json) => _$CityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityResponseToJson(this);
}

@JsonSerializable()
class CoordinatesResponse {
  @JsonKey(name: "lat")
  final double? latitude;
  @JsonKey(name: "lon")
  final double? longitude;

  CoordinatesResponse({
    this.latitude,
    this.longitude,
  });

  factory CoordinatesResponse.fromJson(Map<String, dynamic> json) => _$CoordinatesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesResponseToJson(this);
}


@JsonSerializable()
class CityWeatherResponse {
  final double? temp;
  final double? pressure;
  final double? humidity;

  CityWeatherResponse({
    this.temp,
    this.pressure,
    this.humidity,
  });

  factory CityWeatherResponse.fromJson(Map<String, dynamic> json) => _$CityWeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityWeatherResponseToJson(this);
}
