// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
  ProductDetailsModel instance,
) => <String, dynamic>{'product': instance.product};

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  thumbnail: json['thumbnail'] as String,
  collection: CollectionModel.fromJson(
    json['collection'] as Map<String, dynamic>,
  ),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  images: (json['images'] as List<dynamic>)
      .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  options: (json['options'] as List<dynamic>)
      .map((e) => OptionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'collection': instance.collection,
      'categories': instance.categories,
      'images': instance.images,
      'options': instance.options,
    };

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) =>
    CollectionModel(title: json['title'] as String);

Map<String, dynamic> _$CollectionModelToJson(CollectionModel instance) =>
    <String, dynamic>{'title': instance.title};

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(name: json['name'] as String);

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{'name': instance.name};

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) =>
    ImageModel(url: json['url'] as String);

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{'url': instance.url};

OptionModel _$OptionModelFromJson(Map<String, dynamic> json) => OptionModel(
  title: json['title'] as String,
  values: (json['values'] as List<dynamic>)
      .map((e) => ValueModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OptionModelToJson(OptionModel instance) =>
    <String, dynamic>{'title': instance.title, 'values': instance.values};

ValueModel _$ValueModelFromJson(Map<String, dynamic> json) =>
    ValueModel(value: json['value'] as String);

Map<String, dynamic> _$ValueModelToJson(ValueModel instance) =>
    <String, dynamic>{'value': instance.value};
