// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parcel_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParcelDetailsResponse _$ParcelDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ParcelDetailsResponse(
      (json['width'] as num?)?.toDouble(),
      (json['height'] as num?)?.toDouble(),
      (json['depth'] as num?)?.toDouble(),
      (json['weight'] as num?)?.toDouble(),
      json['package_no'] as String?,
    );

Map<String, dynamic> _$ParcelDetailsResponseToJson(
        ParcelDetailsResponse instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'weight': instance.weight,
      'depth': instance.depth,
      'package_no': instance.packageNo,
    };
