import 'package:hive_ce_flutter/adapters.dart';
import 'package:my_store/features/address/data/data_source/local_data_source/address_local_data_source.dart';
import 'package:my_store/features/address/data/models/address_local_model.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/utils/constants.dart';

class AddressLocalDataSourceImpl implements AddressLocalDataSource {
  final addressBox = Hive.box<AddressResponseLocalModel>(
    AppConstants.addressLocalKey,
  );

  @override
  Future<void> cacheAddresses(
      AddressResponseLocalModel addresses,
      ) async {

    await addressBox.put(
      AppConstants.addressLocalKey,
      addresses,
    );
  }

  @override
  Future<AddressResponseLocalModel> getAddressesLocal() async {
    final address = addressBox.get(AppConstants.addressLocalKey);
    if (address != null) {
      return address;
    } else {
      throw CacheException('No Address cached');
    }
  }
}
