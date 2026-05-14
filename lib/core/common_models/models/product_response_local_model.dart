
import 'package:hive_ce_flutter/adapters.dart';

part 'product_response_local_model.g.dart';

@HiveType(typeId: 0)
class ProductResponseLocalModel extends HiveObject {

  @HiveField(0)
  final List<ProductItemModels>? products;

  @HiveField(1)
  final int? count;

  @HiveField(2)
  final int? offset;

  @HiveField(3)
  final int? limit;

  ProductResponseLocalModel({
    required this.products,
    required this.count,
    required this.offset,
    required this.limit,
  });
}

@HiveType(typeId: 1)
class ProductItemModels extends HiveObject {

  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? subtitle;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final String? thumbnail;

  @HiveField(5)
  final List<VariantModel>? variants;

  ProductItemModels(
      this.id,
      this.title,
      this.subtitle,
      this.description,
      this.thumbnail,
      this.variants,
      );
}

@HiveType(typeId: 2)
class VariantModel extends HiveObject {

  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final CalculatedPriceModel? calculatedPrice;

  VariantModel(
      this.id,
      this.title,
      this.calculatedPrice,
      );
}

@HiveType(typeId: 3)
class CalculatedPriceModel extends HiveObject {

  @HiveField(0)
  final int? calculated_amount;

  CalculatedPriceModel(this.calculated_amount);
}