import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:my_store/features/auth/data/models/auth_model.dart';
import 'package:my_store/features/auth/data/models/customer_model.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';

import '../../../../core/network/rest_client.dart';
import '../../../../core/utils/constants.dart';

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
  Future<AuthResponseModel> login(LoginRequest request)async {
    final response = await _restClient.login({
      "email": request.email,
      "password": request.password,
    });

    // AppConstants.token== null||AppConstants.token == ''?
    // await SharedPrefHelper.setData(key: AppConstants.tokenKey, value: response.token):null;

    await SharedPrefHelper.setData(
      key: AppConstants.tokenKey,
      value: response.token,
    );
    AppConstants.token = response.token;


    print("TOKEN: ${response.token}");

    return response;
  }



  @override
  Future<CustomerModel> register(RegisterRequest request) async{
    final response= await _restClient.registerProfile({
       "email": request.email,
       "last_name": request.lastName,
       "first_name": request.firstName,
       "phone": request.phone,
       "country": request.country,
     });
    return response.customer;
  }

  @override
  Future<CustomerModel> getProfile() async{
    final response= await _restClient.getProfile();
    return response.customer;
  }


}