import 'package:my_store/features/home/domain/entities/product_entities.dart';

abstract class HomeRepositories {

  Future<ProductEntities> getProducts();
}