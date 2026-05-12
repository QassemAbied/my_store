import 'package:hive_ce_flutter/adapters.dart';
import 'package:my_store/core/error/exceptions.dart';
import 'package:my_store/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:my_store/features/auth/data/models/customer_local_model.dart';
import '../../../../../core/utils/constants.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource{


  final profileBox=Hive.box<CustomerResponseLocalModel>(AppConstants.profileLocalKey);
  @override
  Future<void> cacheProfile(CustomerLocalModel customer) async{
  return await profileBox.put(AppConstants.profileLocalKey, CustomerResponseLocalModel(customer: customer));
  }

  @override
  Future<CustomerLocalModel> getLocalProfile() async {
    final profiles= profileBox.get(AppConstants.profileLocalKey);

    if(profiles !=null){
      return profiles.customer;
    }else{
      throw CacheException('No profile found');
    }
  }

}