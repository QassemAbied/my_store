import 'package:my_store/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:my_store/features/auth/data/models/auth_model.dart';
import 'package:my_store/features/auth/data/models/customer_model.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';

import '../../../../core/network/rest_client.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final RestClient _restClient;

  AuthRemoteDataSourceImpl(this._restClient);

  @override
  Future<AuthResponseModel> registerAuth(LoginRequest request)async {
    return await _restClient.registerAuth({
      "email": request.email,
      "password": request.password,
    });
  }

  @override
  Future<CustomerModel> register(RegisterRequest request) async{
     return await _restClient.registerProfile({
       "email": request.email,
       "password": request.password,
       "first_name": request.firstName,
       "phone": request.phone,
       "country": request.country,
     });
  }

  @override
  Future<AuthResponseModel> login(LoginRequest request)async {
    return await _restClient.login({
      "email": request.email,
      "password": request.password,
    });
  }
}