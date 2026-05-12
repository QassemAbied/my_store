import 'package:hive_ce_flutter/adapters.dart';

import '../../../../../core/common_models/models/product_response_local_model.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/utils/constants.dart';
import 'local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl();

  final productBox = Hive.box<ProductResponseLocalModel>(AppConstants.productLocalKey);
  @override
  Future<ProductResponseLocalModel> getProducts() async {


    final products = productBox.get(AppConstants.productLocalKey);

    if (products != null) {
      return products;
    } else {
      throw CacheException('No product cached');
    }
  }

  @override
  Future<void> cacheProducts(
      ProductResponseLocalModel products,
      )
  async {

    if(products.products == null ||
        products.products!.isEmpty){
      return;
    }

    final oldProducts =
    productBox.get(
        AppConstants.productLocalKey);

    if (oldProducts != null) {

      final mergedProducts = [
        ...oldProducts.products ?? [],
        ...products.products ?? [],
      ];

      final uniqueProducts =
      mergedProducts.fold<List<ProductItemModels>>(
        [],
            (list, item) {

          final exists = list.any(
                (e) => e.id == item.id,
          );

          if (!exists) {
            list.add(item);
          }

          return list;
        },
      );

      final newData =
      ProductResponseLocalModel(
        products: uniqueProducts,
        count: products.count,
        offset: products.offset,
        limit: products.limit,
      );

      await productBox.put(
        AppConstants.productLocalKey,
        newData,
      );

    } else {

      await productBox.put(
        AppConstants.productLocalKey,
        products,
      );
    }
  }


}
