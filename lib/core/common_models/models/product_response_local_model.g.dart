// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductResponseLocalModelAdapter
    extends TypeAdapter<ProductResponseLocalModel> {
  @override
  final typeId = 0;

  @override
  ProductResponseLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductResponseLocalModel(
      products: (fields[0] as List?)?.cast<ProductItemModels>(),
      count: (fields[1] as num?)?.toInt(),
      offset: (fields[2] as num?)?.toInt(),
      limit: (fields[3] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductResponseLocalModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.products)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.offset)
      ..writeByte(3)
      ..write(obj.limit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductResponseLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductItemModelsAdapter extends TypeAdapter<ProductItemModels> {
  @override
  final typeId = 1;

  @override
  ProductItemModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductItemModels(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      (fields[5] as List?)?.cast<VariantModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductItemModels obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.thumbnail)
      ..writeByte(5)
      ..write(obj.variants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductItemModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VariantModelAdapter extends TypeAdapter<VariantModel> {
  @override
  final typeId = 2;

  @override
  VariantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VariantModel(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as CalculatedPriceModel?,
    );
  }

  @override
  void write(BinaryWriter writer, VariantModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.calculatedPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CalculatedPriceModelAdapter extends TypeAdapter<CalculatedPriceModel> {
  @override
  final typeId = 3;

  @override
  CalculatedPriceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalculatedPriceModel((fields[0] as num?)?.toInt());
  }

  @override
  void write(BinaryWriter writer, CalculatedPriceModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.calculated_amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculatedPriceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
