
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryResponseModel {
  @JsonKey(name: 'product_categories')
  final List<CategoryModel> categories;

  CategoryResponseModel({
    required this.categories,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson(this);
}
@JsonSerializable()
class CategoryModel {
  final String id;
  final String name;
  final String? description;
  final String handle;

  @JsonKey(name: 'parent_category_id')
  final String? parentCategoryId;

  CategoryModel({
    required this.id,
    required this.name,
    this.description,
    required this.handle,
    this.parentCategoryId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}



