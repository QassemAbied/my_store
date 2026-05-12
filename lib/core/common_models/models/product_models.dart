

import 'package:json_annotation/json_annotation.dart';
part 'product_models.g.dart';



@JsonSerializable()
class ProductResponseModel {
  final List<ProductItemModels>? products;
  final int? count;
  final int? offset;
  final int? limit;

  ProductResponseModel({
    required this.products,
    required this.count,
    required this.offset,
    required this.limit,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);
}
@JsonSerializable()
class ProductItemModels {
  final String? id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? thumbnail;

  final List<VariantModel>? variants;

  ProductItemModels(
      this.id,
      this.title,
      this.subtitle,
      this.description,
      this.thumbnail,
      this.variants,
      );

  factory ProductItemModels.fromJson(Map<String, dynamic> json) =>
      _$ProductItemModelsFromJson(json);
}
@JsonSerializable()
class VariantModel {
  final String? id;
  final String? title;

  @JsonKey(name: "calculated_price")
  final CalculatedPriceModel? calculatedPrice;

  VariantModel(this.id, this.title, this.calculatedPrice);

  factory VariantModel.fromJson(Map<String, dynamic> json) =>
      _$VariantModelFromJson(json);
}
@JsonSerializable()
class CalculatedPriceModel {
  final int? calculated_amount;

  CalculatedPriceModel(this.calculated_amount);

  factory CalculatedPriceModel.fromJson(Map<String, dynamic> json) =>
      _$CalculatedPriceModelFromJson(json);
}
