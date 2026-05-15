import 'package:hive_ce_flutter/adapters.dart';

import '../../features/address/data/models/address_local_model.dart';
import '../../features/auth/data/models/customer_local_model.dart';
import '../../features/cart/data/models/cart_local_model.dart';
import '../../features/category/data/models/category_local_model.dart';
import '../../features/orders/data/models/order_list_local_mode.dart';
import '../../features/orders/data/models/order_review_local_model.dart';
import '../common_models/models/product_response_local_model.dart';
import 'constants.dart';

class OpenBoxesHive {
  static Future<void> hiveRegister()async{
    await Hive.initFlutter();
    Hive.registerAdapter(ProductResponseLocalModelAdapter());
    Hive.registerAdapter(ProductItemModelsAdapter());
    Hive.registerAdapter(VariantModelAdapter());
    Hive.registerAdapter(CalculatedPriceModelAdapter());
    await Hive.openBox<ProductResponseLocalModel>(AppConstants.productLocalKey);
    Hive.registerAdapter(CategoryResponseLocalModelAdapter());
    Hive.registerAdapter(CategoryLocalModelAdapter());
    await Hive.openBox<CategoryResponseLocalModel>(AppConstants.categoryLocalKey);
    Hive.registerAdapter(CartResponseLocalModelAdapter());
    Hive.registerAdapter(CartLocalModelAdapter());
    Hive.registerAdapter(CartItemLocalModelAdapter());
    Hive.registerAdapter(AddressLocalModelAdapter());
    await Hive.openBox<CartResponseLocalModel>(AppConstants.cartLocalKey);
    Hive.registerAdapter(CustomerResponseLocalModelAdapter());
    Hive.registerAdapter(CustomerLocalModelAdapter());
    await Hive.openBox<CustomerResponseLocalModel>(AppConstants.profileLocalKey);
    Hive.registerAdapter(AddressResponseLocalModelAdapter());
    Hive.registerAdapter(AddressItemLocalModelAdapter());
    await Hive.openBox<AddressResponseLocalModel>(AppConstants.addressLocalKey);
    Hive.registerAdapter(OrderReviewResponseLocalModelAdapter());
    Hive.registerAdapter(OrderReviewLocalModelAdapter());
    Hive.registerAdapter(CustomerOrderLocalModelAdapter());
    Hive.registerAdapter(OrderReviewItemLocalModelAdapter());
    Hive.registerAdapter(ShippingAddressLocalModelAdapter());
    await Hive.openBox<OrderReviewResponseLocalModel>(
      AppConstants.orderReviewLocalKey,
    );
    Hive.registerAdapter(OrdersResponseLocalModelAdapter());
    Hive.registerAdapter(OrderLocalModelAdapter());
    Hive.registerAdapter(OrderItemLocalModelAdapter());
    await Hive.openBox<OrdersResponseLocalModel>(AppConstants.orderLocalKey);


    await Hive.openBox<List>(
      AppConstants.deleteAddressLocalKey,
    );

  }
}