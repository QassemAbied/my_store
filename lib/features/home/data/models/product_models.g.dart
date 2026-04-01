// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModels _$ProductModelsFromJson(Map<String, dynamic> json) =>
    ProductModels(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ListProductsModels.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductModelsToJson(ProductModels instance) =>
    <String, dynamic>{
      'products': instance.products,
      'count': instance.count,
      'offset': instance.offset,
      'limit': instance.limit,
    };

ListProductsModels _$ListProductsModelsFromJson(Map<String, dynamic> json) =>
    ListProductsModels(
      id: json['id'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      description: json['description'] as String?,
      handle: json['handle'] as String?,
      is_giftcard: json['is_giftcard'] as bool?,
      discountable: json['discountable'] as bool?,
      thumbnail: json['thumbnail'] as String?,
      collectionId: json['collectionId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      collection: json['collection'] == null
          ? null
          : CollectionModels.fromJson(
              json['collection'] as Map<String, dynamic>,
            ),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => OptionsModels1.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesModels.fromJson(e as Map<String, dynamic>))
          .toList(),
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => VariantsModels.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: json['weight'] as String?,
    );

Map<String, dynamic> _$ListProductsModelsToJson(ListProductsModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'handle': instance.handle,
      'is_giftcard': instance.is_giftcard,
      'discountable': instance.discountable,
      'thumbnail': instance.thumbnail,
      'collectionId': instance.collectionId,
      'weight': instance.weight,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'collection': instance.collection,
      'options': instance.options,
      'images': instance.images,
      'variants': instance.variants,
    };

CollectionModels _$CollectionModelsFromJson(Map<String, dynamic> json) =>
    CollectionModels(
      id: json['id'] as String?,
      title: json['title'] as String?,
      handle: json['handle'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CollectionModelsToJson(CollectionModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'handle': instance.handle,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

OptionsModels1 _$OptionsModels1FromJson(Map<String, dynamic> json) =>
    OptionsModels1(
      id: json['id'] as String?,
      title: json['title'] as String?,
      productId: json['productId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => ValuesModels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OptionsModels1ToJson(OptionsModels1 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'productId': instance.productId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'values': instance.values,
    };

ValuesModels _$ValuesModelsFromJson(Map<String, dynamic> json) => ValuesModels(
  id: json['id'] as String?,
  value: json['value'] as String?,
  optionId: json['optionId'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$ValuesModelsToJson(ValuesModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'optionId': instance.optionId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

ImagesModels _$ImagesModelsFromJson(Map<String, dynamic> json) => ImagesModels(
  id: json['id'] as String?,
  url: json['url'] as String?,
  rank: (json['rank'] as num?)?.toInt(),
  productId: json['productId'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$ImagesModelsToJson(ImagesModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'rank': instance.rank,
      'productId': instance.productId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

VariantsModels _$VariantsModelsFromJson(Map<String, dynamic> json) =>
    VariantsModels(
      id: json['id'] as String?,
      title: json['title'] as String?,
      sku: json['sku'] as String?,
      allowBackorder: json['allowBackorder'] as bool?,
      manageInventory: json['manageInventory'] as bool?,
      variantRank: (json['variantRank'] as num?)?.toInt(),
      productId: json['productId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => OptionsModels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VariantsModelsToJson(VariantsModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sku': instance.sku,
      'allowBackorder': instance.allowBackorder,
      'manageInventory': instance.manageInventory,
      'variantRank': instance.variantRank,
      'productId': instance.productId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'options': instance.options,
    };

OptionsModels _$OptionsModelsFromJson(Map<String, dynamic> json) =>
    OptionsModels(
      id: json['id'] as String?,
      value: json['value'] as String?,
      optionId: json['optionId'] as String?,
      option: json['option'] == null
          ? null
          : Option.fromJson(json['option'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OptionsModelsToJson(OptionsModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'optionId': instance.optionId,
      'option': instance.option,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
  id: json['id'] as String?,
  title: json['title'] as String?,
  productId: json['productId'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'productId': instance.productId,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
