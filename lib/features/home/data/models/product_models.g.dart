// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponseModel _$ProductResponseModelFromJson(
  Map<String, dynamic> json,
) => ProductResponseModel(
  products: (json['products'] as List<dynamic>?)
      ?.map((e) => ProductItemModels.fromJson(e as Map<String, dynamic>))
      .toList(),
  count: (json['count'] as num?)?.toInt(),
  offset: (json['offset'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductResponseModelToJson(
  ProductResponseModel instance,
) => <String, dynamic>{
  'products': instance.products,
  'count': instance.count,
  'offset': instance.offset,
  'limit': instance.limit,
};

ProductItemModels _$ProductItemModelsFromJson(Map<String, dynamic> json) =>
    ProductItemModels(
      json['id'] as String?,
      json['title'] as String?,
      json['subtitle'] as String?,
      json['description'] as String?,
      json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ProductItemModelsToJson(ProductItemModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
    };
