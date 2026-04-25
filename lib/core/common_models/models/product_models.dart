

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
//
//
// @JsonSerializable()
// class ProductResponseModel {
//   final List<ProductItemModels>? products;
//   final int? count;
//   final int? offset;
//   final int? limit;
//
//   ProductResponseModel({
//     required this.products,
//     required this.count,
//     required this.offset,
//     required this.limit,
//   });
//
//   factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>_$ProductResponseModelFromJson(json);
// }
// @JsonSerializable()
// class ProductItemModels{
//   final String? id;
//   final  String? title;
//   final String? subtitle;
//   final  String? description;
//   final String? thumbnail;
//
//   ProductItemModels(this.id, this.title, this.subtitle, this.description, this.thumbnail);
//   factory ProductItemModels.fromJson(Map<String, dynamic> json) =>_$ProductItemModelsFromJson(json);
//
//
//
// }
// @JsonSerializable()
// class ProductModels {
//   final List<ListProductsModels>? products;
//   final int? count;
//   final int? offset;
//   final int? limit;
//
//   ProductModels({this.products, this.count, this.offset, this.limit});
//
//  factory ProductModels.fromJson(Map<String, dynamic> json) =>_$ProductModelsFromJson(json);
//
//
//   Map<String, dynamic> toJson() =>_$ProductModelsToJson(this);
// }
// @JsonSerializable()
// class ListProductsModels {
//   final String? id;
//   final  String? title;
//   final String? subtitle;
//   final  String? description;
//   final  String? handle;
//   final bool? is_giftcard;
//   final bool? discountable;
//   final String? thumbnail;
//   final String? collectionId;
//   final String? weight;
//   final  String? createdAt;
//   final String? updatedAt;
//   final  CollectionModels? collection;
//   final List<OptionsModels1>? options;
//   final List<ImagesModels>? images;
//   final List<VariantsModels>? variants;
//
//   ListProductsModels(
//       {this.id,
//         this.title,
//         this.subtitle,
//         this.description,
//         this.handle,
//         this.is_giftcard,
//         this.discountable,
//         this.thumbnail,
//         this.collectionId,
//         this.createdAt,
//         this.updatedAt,
//         this.collection,
//         this.options,
//         this.images,
//         this.variants,
//         this.weight});
//
//   factory ListProductsModels.fromJson(Map<String, dynamic> json) =>_$ListProductsModelsFromJson(json);
//
//   Map<String, dynamic> toJson() =>_$ListProductsModelsToJson(this);
// }
// @JsonSerializable()
// class CollectionModels {
//   final String? id;
//   final String? title;
//   final String? handle;
//
//   final String? createdAt;
//   final String? updatedAt;
//
//
//   CollectionModels(
//       {this.id,
//         this.title,
//         this.handle,
//
//         this.createdAt,
//         this.updatedAt,
//       });
//   factory CollectionModels.fromJson(Map<String, dynamic> json) =>_$CollectionModelsFromJson(json);
//
//   Map<String, dynamic> toJson() =>_$CollectionModelsToJson(this);
// }
// @JsonSerializable()
// class OptionsModels1 {
//   final String? id;
//   final String? title;
//   final String? productId;
//   final  String? createdAt;
//   final  String? updatedAt;
//   final List<ValuesModels>? values;
//
//   OptionsModels1(
//       {this.id,
//         this.title,
//         this.productId,
//         this.createdAt,
//         this.updatedAt,
//         this.values});
//
//   factory OptionsModels1.fromJson(Map<String, dynamic> json) =>_$OptionsModels1FromJson(json);
//
//   Map<String, dynamic> toJson() =>_$OptionsModels1ToJson(this);
// }
// @JsonSerializable()
// class ValuesModels {
//   final  String? id;
//   final String? value;
//   final  String? optionId;
//   final String? createdAt;
//   final String? updatedAt;
//
//
//   ValuesModels(
//       {this.id,
//         this.value,
//         this.optionId,
//         this.createdAt,
//         this.updatedAt,
//       });
//
//   factory ValuesModels.fromJson(Map<String, dynamic> json) =>_$ValuesModelsFromJson(json);
//
//   Map<String, dynamic> toJson() =>_$ValuesModelsToJson(this);
// }
// @JsonSerializable()
// class ImagesModels {
//   final String? id;
//   final String? url;
//   final int? rank;
//   final String? productId;
//   final String? createdAt;
//   final String? updatedAt;
//
//
//   ImagesModels(
//       {this.id,
//         this.url,
//         this.rank,
//         this.productId,
//         this.createdAt,
//         this.updatedAt,
//       });
//
//   factory ImagesModels.fromJson(Map<String, dynamic> json) =>_$ImagesModelsFromJson(json);
//
//   Map<String, dynamic> toJson() =>_$ImagesModelsToJson(this);
// }
// @JsonSerializable()
// class VariantsModels {
//   final String? id;
//   final  String? title;
//   final String? sku;
//   final bool? allowBackorder;
//   final  bool? manageInventory;
//   final int? variantRank;
//   final String? productId;
//   final String? createdAt;
//   final String? updatedAt;
//   final List<OptionsModels>? options;
//
//   VariantsModels(
//       {this.id,
//         this.title,
//         this.sku,
//         this.allowBackorder,
//         this.manageInventory,
//         this.variantRank,
//         this.productId,
//         this.createdAt,
//         this.updatedAt,
//         this.options});
//
//   factory VariantsModels.fromJson(Map<String, dynamic> json) =>_$VariantsModelsFromJson(json);
//
//   Map<String, dynamic> toJson() =>_$VariantsModelsToJson(this);
// }
// @JsonSerializable()
// class OptionsModels {
//   final String? id;
//   final String? value;
//   final String? optionId;
//   final Option? option;
//   final  String? createdAt;
//   final String? updatedAt;
//
//
//   OptionsModels(
//       {this.id,
//         this.value,
//
//         this.optionId,
//         this.option,
//         this.createdAt,
//         this.updatedAt,
//       });
//
//   factory OptionsModels.fromJson(Map<String, dynamic> json) =>_$OptionsModelsFromJson(json);
//
//   Map<String, dynamic> toJson() =>_$OptionsModelsToJson(this);
// }
// @JsonSerializable()
// class Option {
//   final String? id;
//   final String? title;
//   final String? productId;
//   final String? createdAt;
//   final String? updatedAt;
//
//
//   Option(
//       {this.id,
//         this.title,
//         this.productId,
//         this.createdAt,
//         this.updatedAt,
//       });
//
//   factory Option.fromJson(Map<String, dynamic> json) =>_$OptionFromJson(json);
//
//   Map<String, dynamic> toJson() =>_$OptionToJson(this);
// }