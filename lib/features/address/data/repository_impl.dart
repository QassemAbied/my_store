import 'package:hive_ce_flutter/adapters.dart';
import 'package:my_store/core/network/network_info.dart';
import 'package:my_store/core/utils/constants.dart';
import 'package:my_store/features/address/data/data_source/local_data_source/address_local_data_source.dart';
import 'package:my_store/features/address/domain/mapper/address_local_mapper.dart';

import '../../../core/error/error_handler.dart';
import '../../../core/network/api_result.dart';
import '../domain/entities/address_entities.dart';
import '../domain/entities/address_request.dart';
import '../domain/mapper/address_mapper.dart';
import '../domain/repository.dart';
import 'data_source/remote_data_source/remote_data_source.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDataSource _addressRemoteDataSource;
  final AddressLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  AddressRepositoryImpl(
    this._addressRemoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );
  final deletedBox = Hive.box<List>(AppConstants.deleteAddressLocalKey);
  @override
  Future<ApiResult<void>> addAddress(CreateAddressParams body) async {
    try {
      final oldLocal = await _localDataSource.getAddressesLocal();

      final oldEntity = AddressLocalMapper.toLocalEntity(oldLocal);

      final updated = AddressResponseEntity(
        addresses: [
          AddressEntity(
            id: DateTime.now().millisecondsSinceEpoch.toString(),

            firstName: body.firstName,

            lastName: body.lastName,

            phone: body.phone,

            address1: body.address1,

            address2: body.address2,

            city: body.city,

            countryCode: body.countryCode,
          ),

          ...oldEntity.addresses,
        ],
      );

      final localModel = AddressLocalMapper.toLocalEntityModel(updated);

      await _localDataSource.cacheAddresses(localModel);

      if (await _networkInfo.isServerAlive) {
        await _addressRemoteDataSource.addAddress(body);
      }

      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<void>> deleteAddress(String addressId) async {
    try {
      final oldLocal = await _localDataSource.getAddressesLocal();

      final oldEntity = AddressLocalMapper.toLocalEntity(oldLocal);

      oldEntity.addresses.removeWhere((e) => e.id == addressId);

      final localModel = AddressLocalMapper.toLocalEntityModel(oldEntity);

      await _localDataSource.cacheAddresses(localModel);

      if (await _networkInfo.isServerAlive) {
        await _addressRemoteDataSource.deleteAddress(addressId);
      } else {
        final ids = deletedBox.get('ids', defaultValue: []);

        ids?.add(addressId);

        await deletedBox.put('ids', ids!);
      }

      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<AddressResponseEntity>> getAddresses() async {
    if (await _networkInfo.isServerAlive) {
      try {

        final ids = deletedBox.get('ids', defaultValue: []);

        for (final id in ids!) {
          await _addressRemoteDataSource.deleteAddress(id);
        }

        await deletedBox.put('ids', []);
        AddressResponseEntity localEntity;

        try {
          final localCached = await _localDataSource.getAddressesLocal();
          localEntity = AddressLocalMapper.toLocalEntity(localCached);
        } catch (_) {
          localEntity = AddressResponseEntity(addresses: []);
        }

        var res = await _addressRemoteDataSource.getAddresses();

        var serverEntity = res.toEntity();

        for (final address in localEntity.addresses) {
          final exists = serverEntity.addresses.any(
            (e) =>
                e.address1 == address.address1 &&
                e.city == address.city &&
                e.phone == address.phone,
          );

          if (!exists) {
            await _addressRemoteDataSource.addAddress(
              CreateAddressParams(
                firstName: address.firstName ?? '',

                lastName: address.lastName ?? '',

                phone: address.phone,

                address1: address.address1,

                address2: address.address2,

                city: address.city,

                countryCode: address.countryCode,
              ),
            );
          }
        }

        res = await _addressRemoteDataSource.getAddresses();

        serverEntity = res.toEntity();

        final localModel = AddressLocalMapper.toLocalEntityModel(serverEntity);

        await _localDataSource.cacheAddresses(localModel);

        return ApiResult.success(serverEntity);
      } catch (e) {
        try {
          final addressCached = await _localDataSource.getAddressesLocal();

          final addressLocal = AddressLocalMapper.toLocalEntity(addressCached);

          return ApiResult.success(addressLocal);
        } catch (_) {
          return ApiResult.failure(ErrorHandler.handle(e));
        }
      }
    } else {
      try {
        final addressCached = await _localDataSource.getAddressesLocal();

        final addressLocal = AddressLocalMapper.toLocalEntity(addressCached);

        return ApiResult.success(addressLocal);
      } catch (e) {
        return ApiResult.failure(ErrorHandler.handle(e));
      }
    }
  }
}
