import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel {
  final ProductModel product;

  ProductDetailsModel({required this.product});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
}

@JsonSerializable()
class ProductModel {
  final String id;
  final String title;
  final String description;
  final String thumbnail;
  final CollectionModel collection;
  final List<CategoryModel> categories;
  final List<ImageModel> images;
  final List<OptionModel> options;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.collection,
    required this.categories,
    required this.images,
    required this.options,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@JsonSerializable()
class CollectionModel {
  final String title;

  CollectionModel({required this.title});

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);
}

@JsonSerializable()
class CategoryModel {
  final String name;

  CategoryModel({required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@JsonSerializable()
class ImageModel {
  final String url;

  ImageModel({required this.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}

@JsonSerializable()
class OptionModel {
  final String title;
  final List<ValueModel> values;

  OptionModel({required this.title, required this.values});

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);
}

@JsonSerializable()
class ValueModel {
  final String value;

  ValueModel({required this.value});

  factory ValueModel.fromJson(Map<String, dynamic> json) =>
      _$ValueModelFromJson(json);
}
