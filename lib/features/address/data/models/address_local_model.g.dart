// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressResponseLocalModelAdapter
    extends TypeAdapter<AddressResponseLocalModel> {
  @override
  final typeId = 45;

  @override
  AddressResponseLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressResponseLocalModel(
      addresses: (fields[0] as List).cast<AddressItemLocalModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, AddressResponseLocalModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.addresses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressResponseLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressItemLocalModelAdapter extends TypeAdapter<AddressItemLocalModel> {
  @override
  final typeId = 46;

  @override
  AddressItemLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressItemLocalModel(
      id: fields[0] as String,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      phone: fields[3] as String?,
      address1: fields[4] as String,
      address2: fields[5] as String?,
      city: fields[6] as String,
      countryCode: fields[7] as String,
      postalCode: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddressItemLocalModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.address1)
      ..writeByte(5)
      ..write(obj.address2)
      ..writeByte(6)
      ..write(obj.city)
      ..writeByte(7)
      ..write(obj.countryCode)
      ..writeByte(8)
      ..write(obj.postalCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressItemLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
