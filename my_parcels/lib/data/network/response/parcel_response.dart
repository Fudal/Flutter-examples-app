import 'package:json_annotation/json_annotation.dart';
import 'package:my_parcels/data/network/response/parcel_details_response.dart';
import 'package:my_parcels/data/network/response/person_response.dart';

part 'parcel_response.g.dart';

@JsonSerializable()
class ParcelResponse {
  final int? id;
  final String? service;
  @JsonKey(name: "datetime_send")
  final String? datetimeSend;
  final PersonResponse sender;
  final PersonResponse receiver;
  final ParcelDetailsResponse parcels;

  ParcelResponse(
      this.id,
      this.service,
      this.datetimeSend,
      this.sender,
      this.receiver,
      this.parcels,
      );

  factory ParcelResponse.fromJson(Map<String, dynamic> json) => _$ParcelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ParcelResponseToJson(this);
}
