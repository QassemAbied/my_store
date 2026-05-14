// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_local_mode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrdersResponseLocalModelAdapter
    extends TypeAdapter<OrdersResponseLocalModel> {
  @override
  final typeId = 14;

  @override
  OrdersResponseLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrdersResponseLocalModel(
      orders: (fields[0] as List).cast<OrderLocalModel>(),
      count: (fields[1] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, OrdersResponseLocalModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.orders)
      ..writeByte(1)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrdersResponseLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderLocalModelAdapter extends TypeAdapter<OrderLocalModel> {
  @override
  final typeId = 15;

  @override
  OrderLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderLocalModel(
      id: fields[0] as String,
      status: fields[1] as String,
      total: (fields[2] as num).toInt(),
      createdAt: fields[3] as String,
      items: (fields[4] as List).cast<OrderItemLocalModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderLocalModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.total)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderItemLocalModelAdapter extends TypeAdapter<OrderItemLocalModel> {
  @override
  final typeId = 16;

  @override
  OrderItemLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderItemLocalModel(
      title: fields[0] as String,
      quantity: (fields[1] as num).toInt(),
      unitPrice: (fields[2] as num).toInt(),
      thumbnail: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderItemLocalModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.unitPrice)
      ..writeByte(3)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItemLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
