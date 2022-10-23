// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parcel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParcelResponse _$ParcelResponseFromJson(Map<String, dynamic> json) =>
    ParcelResponse(
      json['id'] as int?,
      json['service'] as String?,
      json['datetime_send'] as String?,
      PersonResponse.fromJson(json['sender'] as Map<String, dynamic>),
      PersonResponse.fromJson(json['receiver'] as Map<String, dynamic>),
      ParcelDetailsResponse.fromJson(json['parcels'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParcelResponseToJson(ParcelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'datetime_send': instance.datetimeSend,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'parcels': instance.parcels,
    };
