// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_message_local_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AiMessageLocalModelAdapter extends TypeAdapter<AiMessageLocalModel> {
  @override
  final typeId = 30;

  @override
  AiMessageLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AiMessageLocalModel(
      message: fields[0] as String,
      isUser: fields[1] as bool,
      imagePath: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AiMessageLocalModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.isUser)
      ..writeByte(2)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AiMessageLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
