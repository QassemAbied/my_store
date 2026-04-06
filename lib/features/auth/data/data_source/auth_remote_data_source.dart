import 'package:my_store/features/auth/data/models/auth_model.dart';
import 'package:my_store/features/auth/data/models/customer_model.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> registerAuth( LoginRequest request);
  Future<CustomerModel> register( RegisterRequest request);
  Future<AuthResponseModel> login( LoginRequest request);

}