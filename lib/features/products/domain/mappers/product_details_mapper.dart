import '../../data/models/product_details_model.dart';
import '../entities/product_details_entities.dart';

class ProductDetailsMapper {
  static ProductDetailsEntities toEntity(ProductDetailsModel model) {
    return ProductDetailsEntities(product: _productToEntity(model.product));
  }

  // 🟢 Product
  static ProductEntities _productToEntity(ProductModel model) {
    return ProductEntities(
      id: model.id,
      title: model.title,
      description: model.description,
      thumbnail: model.thumbnail,
      collection: _collectionToEntity(model.collection),
      categories: _categoriesToEntityList(model.categories),
      images: _imagesToEntityList(model.images),
      options: _optionsToEntityList(model.options),
    );
  }

  // 🟡 Collection
  static CollectionEntities _collectionToEntity(CollectionModel model) {
    return CollectionEntities(title: model.title);
  }

  // 🔵 Categories
  static List<CategoryEntities> _categoriesToEntityList(
    List<CategoryModel> models,
  ) {
    return models.map((e) => CategoryEntities(name: e.name)).toList();
  }

  // 🟣 Images
  static List<ImageEntities> _imagesToEntityList(List<ImageModel> models) {
    return models.map((e) => ImageEntities(url: e.url)).toList();
  }

  // 🟠 Options
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

  // 🔴 Values
  static List<ValueEntities> _valuesToEntityList(List<ValueModel> models) {
    return models.map((e) => ValueEntities(value: e.value)).toList();
  }
}
