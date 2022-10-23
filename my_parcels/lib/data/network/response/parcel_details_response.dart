import 'package:json_annotation/json_annotation.dart';

part 'parcel_details_response.g.dart';

@JsonSerializable()
class ParcelDetailsResponse {
  final double? width;
  final double? height;
  final double? weight;
  final double? depth;
  @JsonKey(name: "package_no")
  final String? packageNo;

  ParcelDetailsResponse(
      this.width,
      this.height,
      this.depth,
      this.weight,
      this.packageNo,
      );

  factory ParcelDetailsResponse.fromJson(Map<String, dynamic> json) => _$ParcelDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ParcelDetailsResponseToJson(this);
}
