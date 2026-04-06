import '../../data/models/auth_model.dart';
import '../entities/auth_entity.dart';

extension AuthMapper on AuthResponseModel {
  AuthEntity toEntity() {
    return AuthEntity(token: token);
  }
}