import 'package:hive_ce_flutter/adapters.dart';
import 'package:my_store/core/common_models/models/product_response_local_model.dart';

import 'package:my_store/features/category/data/models/category_local_model.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/utils/constants.dart';
import 'category_local_data_source.dart';

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource{

  var categoryBox = Hive.box<CategoryResponseLocalModel>(AppConstants.categoryLocalKey);
  final productBox =
  Hive.box<ProductResponseLocalModel>(
      AppConstants.productLocalKey);
  @override
  Future<void> cacheCategoriesLocal(CategoryResponseLocalModel categories) async{
    return await categoryBox.put(AppConstants.categoryLocalKey, categories);
  }

  @override
  Future<void> cacheProductsByCategoryLocal(ProductResponseLocalModel products, String categoryId)async {
    return await productBox.put(categoryId, products);
  }

  @override
  Future<CategoryResponseLocalModel> getCategoriesLocal()async {
   final categories = categoryBox.get(AppConstants.categoryLocalKey);
   if (categories != null) {
     return categories;
   } else {
     throw CacheException('No product cached');
   }
  }

  @override
  Future<ProductResponseLocalModel> getProductsByCategoryLocal(String categoryId) async{
   final products = productBox.get(categoryId);
   if (products != null) {
     return products;
   } else {
     throw CacheException('No product cached');
   }
  }

  }
