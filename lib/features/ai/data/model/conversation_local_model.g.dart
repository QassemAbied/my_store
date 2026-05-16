// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConversationLocalModelAdapter
    extends TypeAdapter<ConversationLocalModel> {
  @override
  final typeId = 31;

  @override
  ConversationLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConversationLocalModel(
      id: fields[0] as String,
      title: fields[1] as String,
      messages: (fields[2] as List).cast<AiMessageLocalModel>(),
      createdAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ConversationLocalModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.messages)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
