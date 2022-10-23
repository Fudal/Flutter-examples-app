// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_city_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCityItemAdapter extends TypeAdapter<HiveCityItem> {
  @override
  final int typeId = 1;

  @override
  HiveCityItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCityItem(
      cityName: fields[0] as String?,
      latitude: fields[1] as double?,
      longitude: fields[2] as double?,
      windSpeed: fields[3] as double?,
      isFavorite: fields[5] as bool?,
      temp: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCityItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.cityName)
      ..writeByte(1)
      ..write(obj.latitude)
      ..writeByte(2)
      ..write(obj.longitude)
      ..writeByte(3)
      ..write(obj.windSpeed)
      ..writeByte(4)
      ..write(obj.temp)
      ..writeByte(5)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCityItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
