// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SWITCHBOXAdapter extends TypeAdapter<SWITCHBOX> {
  @override
  final int typeId = 1;

  @override
  SWITCHBOX read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SWITCHBOX(
      switch_count: fields[3] as num,
      switch_name: fields[0] as String,
      topic_name: fields[2] as String,
      location_address: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SWITCHBOX obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.switch_name)
      ..writeByte(1)
      ..write(obj.location_address)
      ..writeByte(2)
      ..write(obj.topic_name)
      ..writeByte(3)
      ..write(obj.switch_count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SWITCHBOXAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CODEBOXAdapter extends TypeAdapter<CODEBOX> {
  @override
  final int typeId = 2;

  @override
  CODEBOX read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CODEBOX(
      code: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CODEBOX obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CODEBOXAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
