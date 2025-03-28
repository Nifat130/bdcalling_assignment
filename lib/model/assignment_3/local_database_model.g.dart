// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalDatabaseModelAdapter extends TypeAdapter<LocalDatabaseModel> {
  @override
  final int typeId = 1;

  @override
  LocalDatabaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalDatabaseModel(
      postId: fields[0] as int?,
      id: fields[1] as int?,
      name: fields[2] as String?,
      email: fields[3] as String?,
      body: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalDatabaseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.postId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.body);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalDatabaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
