



import 'package:my_store/features/home/data/models/product_models.dart' as model;
import 'package:my_store/features/home/domain/entities/product_entities.dart' as entity;

class ProductMapper {
  static entity.ProductResponseEntity productResponseItemEntity(model.ProductResponseModel model) {
    return entity.ProductResponseEntity(
        products: model.products
                ?.map((product) => productItemEntity(product))
                 .toList(),
        count: model.count,
        offset: model.offset,
        limit: model.limit

    );
  }
  static entity.ProductItemEntity productItemEntity(model.ProductItemModels model) {
    return entity.ProductItemEntity(
      id: model.id,
      title: model.title,
      subtitle: model.subtitle,
      description: model.description,
      thumbnail: model.thumbnail,
    );
  }

  // // Convert ProductModels (Data Layer) to ProductEntities (Domain Layer)
  // static entity.ProductEntities toEntity(model.ProductModels model) {
  //   return entity.ProductEntities(
  //     products: model.products
  //         ?.map((product) => _productModelToEntity(product))
  //         .toList(),
  //     count: model.count,
  //     offset: model.offset,
  //     limit: model.limit,
  //   );
  // }
  //
  //
  // // Helper: Convert ListProductsModels to Products Entity
  // static entity.Products _productModelToEntity(model.ListProductsModels model) {
  //   return entity.Products(
  //     id: model.id,
  //     title: model.title,
  //     subtitle: model.subtitle,
  //     description: model.description,
  //     handle: model.handle,
  //     isGiftcard: model.is_giftcard,
  //     discountable: model.discountable,
  //     thumbnail: model.thumbnail,
  //     collectionId: model.collectionId,
  //     weight: model.weight,
  //     createdAt: model.createdAt,
  //     updatedAt: model.updatedAt,
  //     collection: model.collection != null
  //         ? _collectionModelToEntity(model.collection!)
  //         : null,
  //     options: model.options
  //         ?.map((option) => _optionsModelToEntity(option))
  //         .toList(),
  //     images: model.images
  //         ?.map((image) => _imagesModelToEntity(image))
  //         .toList(),
  //     variants: model.variants
  //         ?.map((variant) => _variantsModelToEntity(variant))
  //         .toList(),
  //   );
  // }
  //
  //
  //
  // // Collection conversions
  // static entity.Collection _collectionModelToEntity(model.CollectionModels model) {
  //   return entity.Collection(
  //     id: model.id,
  //     title: model.title,
  //     handle: model.handle,
  //     createdAt: model.createdAt,
  //     updatedAt: model.updatedAt,
  //   );
  // }
  //
  //
  // // Options conversions
  // static entity.Options1 _optionsModelToEntity(model.OptionsModels1 model) {
  //   return entity.Options1(
  //     id: model.id,
  //     title: model.title,
  //     productId: model.productId,
  //     createdAt: model.createdAt,
  //     updatedAt: model.updatedAt,
  //     values: model.values
  //         ?.map((value) => _valuesModelToEntity(value))
  //         .toList(),
  //   );
  // }
  //
  //
  // // Values conversions
  // static entity.Values _valuesModelToEntity(model.ValuesModels model) {
  //   return entity.Values(
  //     id: model.id,
  //     value: model.value,
  //     optionId: model.optionId,
  //     createdAt: model.createdAt,
  //     updatedAt: model.updatedAt,
  //   );
  // }
  //
  //
  // // Images conversions
  // static entity.Images _imagesModelToEntity(model.ImagesModels model) {
  //   return entity.Images(
  //     id: model.id,
  //     url: model.url,
  //     rank: model.rank,
  //     productId: model.productId,
  //     createdAt: model.createdAt,
  //     updatedAt: model.updatedAt,
  //   );
  // }
  //
  //
  // // Variants conversions
  // static entity.Variants _variantsModelToEntity(model.VariantsModels model) {
  //   return entity.Variants(
  //     id: model.id,
  //     title: model.title,
  //     sku: model.sku,
  //     allowBackorder: model.allowBackorder,
  //     manageInventory: model.manageInventory,
  //     variantRank: model.variantRank,
  //     productId: model.productId,
  //     createdAt: model.createdAt,
  //     updatedAt: model.updatedAt,
  //     options: model.options
  //         ?.map((option) => _optionsVariantModelToEntity(option))
  //         .toList(),
  //   );
  // }
  //
  //
  // // Options in Variants conversions
  // static entity.Options _optionsVariantModelToEntity(model.OptionsModels model) {
  //   return entity.Options(
  //     id: model.id,
  //     value: model.value,
  //     optionId: model.optionId,
  //     option: model.option != null ? _optionModelToEntity(model.option!) : null,
  //     createdAt: model.createdAt,
  //     updatedAt: model.updatedAt,
  //   );
  // }
  //
  //
  // // Option conversions
  // static entity.Option _optionModelToEntity(model.Option model) {
  //   return entity.Option(
  //     id: model.id,
  //     title: model.title,
  //     productId: model.productId,
  //     createdAt: model.createdAt,
  //     updatedAt: model.updatedAt,
  //   );
  // }

}

