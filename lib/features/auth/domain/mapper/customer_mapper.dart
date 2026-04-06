import 'package:my_store/features/auth/domain/entities/customer_entity.dart';

import '../../data/models/customer_model.dart';

extension CustomerMapper on CustomerModel {
  CustomerEntity toEntity() {
    return CustomerEntity(
      email: email,
      firstName: firstName,
      phone: phone,
      country: country,


    );
  }
}