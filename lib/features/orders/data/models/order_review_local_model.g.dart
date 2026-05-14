// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_review_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderReviewResponseLocalModelAdapter
    extends TypeAdapter<OrderReviewResponseLocalModel> {
  @override
  final typeId = 17;

  @override
  OrderReviewResponseLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderReviewResponseLocalModel(
      order: fields[0] as OrderReviewLocalModel,
    );
  }

  @override
  void write(BinaryWriter writer, OrderReviewResponseLocalModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.order);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderReviewResponseLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderReviewLocalModelAdapter extends TypeAdapter<OrderReviewLocalModel> {
  @override
  final typeId = 18;

  @override
  OrderReviewLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderReviewLocalModel(
      id: fields[0] as String,
      status: fields[1] as String,
      currencyCode: fields[2] as String,
      createdAt: fields[3] as String,
      total: (fields[4] as num).toInt(),
      items: (fields[5] as List).cast<OrderReviewItemLocalModel>(),
      shippingAddress: fields[6] as ShippingAddressLocalModel?,
      customer: fields[7] as CustomerOrderLocalModel?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderReviewLocalModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.currencyCode)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.total)
      ..writeByte(5)
      ..write(obj.items)
      ..writeByte(6)
      ..write(obj.shippingAddress)
      ..writeByte(7)
      ..write(obj.customer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderReviewLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomerOrderLocalModelAdapter
    extends TypeAdapter<CustomerOrderLocalModel> {
  @override
  final typeId = 19;

  @override
  CustomerOrderLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerOrderLocalModel(email: fields[0] as String?);
  }

  @override
  void write(BinaryWriter writer, CustomerOrderLocalModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerOrderLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderReviewItemLocalModelAdapter
    extends TypeAdapter<OrderReviewItemLocalModel> {
  @override
  final typeId = 20;

  @override
  OrderReviewItemLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderReviewItemLocalModel(
      title: fields[0] as String,
      quantity: (fields[1] as num).toInt(),
      unitPrice: (fields[2] as num).toInt(),
      thumbnail: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderReviewItemLocalModel obj) {
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
      other is OrderReviewItemLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShippingAddressLocalModelAdapter
    extends TypeAdapter<ShippingAddressLocalModel> {
  @override
  final typeId = 21;

  @override
  ShippingAddressLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShippingAddressLocalModel(
      address1: fields[0] as String,
      city: fields[1] as String,
      countryCode: fields[2] as String,
      firstName: fields[3] as String?,
      lastName: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ShippingAddressLocalModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.address1)
      ..writeByte(1)
      ..write(obj.city)
      ..writeByte(2)
      ..write(obj.countryCode)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingAddressLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
