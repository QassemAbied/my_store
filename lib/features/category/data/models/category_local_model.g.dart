// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryResponseLocalModelAdapter
    extends TypeAdapter<CategoryResponseLocalModel> {
  @override
  final typeId = 4;

  @override
  CategoryResponseLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryResponseLocalModel(
      categories: (fields[0] as List).cast<CategoryLocalModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryResponseLocalModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryResponseLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryLocalModelAdapter extends TypeAdapter<CategoryLocalModel> {
  @override
  final typeId = 5;

  @override
  CategoryLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryLocalModel(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String?,
      handle: fields[3] as String,
      parentCategoryId: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryLocalModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.handle)
      ..writeByte(4)
      ..write(obj.parentCategoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
