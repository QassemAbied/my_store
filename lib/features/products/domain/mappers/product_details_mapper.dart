import '../../data/models/product_details_model.dart';
import '../entities/product_details_entities.dart';

class ProductDetailsMapper {
  static ProductDetailsEntities toEntity(ProductDetailsModel model) {
    return ProductDetailsEntities(product: _productToEntity(model.product));
  }

  static ProductEntities _productToEntity(ProductModel model) {
    return ProductEntities(
      id: model.id,
      title: model.title,
      description: model.description,
      thumbnail: model.thumbnail,
      collection: model.collection != null
          ? _collectionToEntity(model.collection!)
          : null,
      categories: model.categories != null
          ? _categoriesToEntityList(model.categories!)
          : [],
      images: model.images != null
          ? _imagesToEntityList(model.images!)
          : [],
      options: model.options != null
          ? _optionsToEntityList(model.options!)
          : [],
      variants: model.variants != null
          ? _variantsToEntityList(model.variants!)
          : [],
    );
  }

  static CollectionEntities _collectionToEntity(CollectionModel model) {
    return CollectionEntities(title: model.title);
  }

  static List<CategoryEntities> _categoriesToEntityList(
    List<CategoryModel> models,
  ) {
    return models.map((e) => CategoryEntities(name: e.name)).toList();
  }

  static List<ImageEntities> _imagesToEntityList(List<ImageModel> models) {
    return models.map((e) => ImageEntities(url: e.url)).toList();
  }

  static List<OptionEntities> _optionsToEntityList(List<OptionModel> models) {
    return models
        .map(
          (e) => OptionEntities(
            title: e.title,
            values: _valuesToEntityList(e.values),
          ),
        )
        .toList();
  }

  static List<ValueEntities> _valuesToEntityList(List<ValueModel> models) {
    return models.map((e) => ValueEntities(value: e.value)).toList();
  }
  static List<ProductVariantEntities> _variantsToEntityList(
      List<ProductVariantModel> models,
      ) {
    return models.map((e) {
      return ProductVariantEntities(
        id: e.id??'',
        title: e.title ?? "",
        sku: e.sku ?? "",
        manageInventory: e.manageInventory ?? false,
        options: _valuesToEntityList(e.options ?? []),
      );
    }).toList();
  }

}
