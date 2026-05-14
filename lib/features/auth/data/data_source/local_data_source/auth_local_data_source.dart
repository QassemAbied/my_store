import '../../models/customer_local_model.dart';

abstract class AuthLocalDataSource {
  Future<CustomerLocalModel> getLocalProfile();
  Future<void> cacheProfile(CustomerLocalModel customer);
}
