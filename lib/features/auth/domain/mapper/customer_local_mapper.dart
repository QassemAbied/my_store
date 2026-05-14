import '../../data/models/customer_local_model.dart';
import '../../data/models/customer_model.dart';
import '../entities/customer_entity.dart';

class CustomerLocalMapper {
  static CustomerEntity toLocalEntity(CustomerLocalModel customer)
  {
    return CustomerEntity(
      email: customer.email,
      firstName: customer.firstName,
      lastName: customer.lastName,
      phone: customer.phone,
      country: customer.country,
    );
  }

  static CustomerResponseLocalModel toLocalModel(CustomerResponseModel customer)
  {
    return CustomerResponseLocalModel(
      customer:toLocalCustomerModel(customer.customer),
    );
  }

  static CustomerLocalModel toLocalCustomerModel(CustomerModel customer){
    return CustomerLocalModel(
      email: customer.email,
      firstName: customer.firstName,
      lastName: customer.lastName,
      phone: customer.phone,
      country: customer.country,
    );
  }
  }
