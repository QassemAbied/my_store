// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerResponseLocalModelAdapter
    extends TypeAdapter<CustomerResponseLocalModel> {
  @override
  final typeId = 10;

  @override
  CustomerResponseLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerResponseLocalModel(
      customer: fields[0] as CustomerLocalModel,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerResponseLocalModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.customer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerResponseLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomerLocalModelAdapter extends TypeAdapter<CustomerLocalModel> {
  @override
  final typeId = 11;

  @override
  CustomerLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerLocalModel(
      email: fields[0] as String,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      phone: fields[3] as String?,
      country: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerLocalModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
