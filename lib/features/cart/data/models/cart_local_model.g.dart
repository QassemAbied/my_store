// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartResponseLocalModelAdapter
    extends TypeAdapter<CartResponseLocalModel> {
  @override
  final typeId = 6;

  @override
  CartResponseLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartResponseLocalModel(cart: fields[0] as CartLocalModel);
  }

  @override
  void write(BinaryWriter writer, CartResponseLocalModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.cart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartResponseLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CartLocalModelAdapter extends TypeAdapter<CartLocalModel> {
  @override
  final typeId = 7;

  @override
  CartLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartLocalModel(
      id: fields[0] as String,
      regionId: fields[1] as String,
      total: (fields[4] as num).toInt(),
      items: (fields[7] as List).cast<CartItemLocalModel>(),
      currencyCode: fields[2] as String?,
      email: fields[3] as String?,
      subtotal: (fields[5] as num?)?.toInt(),
      shippingTotal: (fields[6] as num?)?.toInt(),
      shippingAddress: fields[8] as AddressLocalModel?,
      billingAddress: fields[9] as AddressLocalModel?,
    );
  }

  @override
  void write(BinaryWriter writer, CartLocalModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.regionId)
      ..writeByte(2)
      ..write(obj.currencyCode)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.total)
      ..writeByte(5)
      ..write(obj.subtotal)
      ..writeByte(6)
      ..write(obj.shippingTotal)
      ..writeByte(7)
      ..write(obj.items)
      ..writeByte(8)
      ..write(obj.shippingAddress)
      ..writeByte(9)
      ..write(obj.billingAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CartItemLocalModelAdapter extends TypeAdapter<CartItemLocalModel> {
  @override
  final typeId = 8;

  @override
  CartItemLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItemLocalModel(
      id: fields[0] as String,
      title: fields[1] as String,
      variantId: fields[2] as String,
      quantity: (fields[3] as num).toInt(),
      productId: fields[4] as String,
      thumbnail: fields[5] as String,
      price: (fields[6] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, CartItemLocalModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.variantId)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.productId)
      ..writeByte(5)
      ..write(obj.thumbnail)
      ..writeByte(6)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressLocalModelAdapter extends TypeAdapter<AddressLocalModel> {
  @override
  final typeId = 9;

  @override
  AddressLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressLocalModel(
      firstName: fields[0] as String?,
      lastName: fields[1] as String?,
      address1: fields[2] as String?,
      city: fields[3] as String?,
      countryCode: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddressLocalModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.address1)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.countryCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
