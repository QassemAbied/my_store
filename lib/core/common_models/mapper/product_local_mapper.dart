import '../entities/product_entities.dart';
import '../models/product_response_local_model.dart' as local;
import '../models/product_models.dart' as remote;

class ProductLocalMapper {
  static ProductResponseEntity toEntity(local.ProductResponseLocalModel model) {
    return ProductResponseEntity(
      products: model.products?.map((e) => toItemEntity(e)).toList(),
      count: model.count,
      offset: model.offset,
      limit: model.limit,
    );
  }

  static ProductItemEntity toItemEntity(local.ProductItemModels model) {
    return ProductItemEntity(
      id: model.id,
      title: model.title,
      subtitle: model.subtitle,
      description: model.description,
      thumbnail: model.thumbnail,
      variants: model.variants?.map((e) => toVariantEntity(e)).toList(),
    );
  }

  static VariantEntity toVariantEntity(local.VariantModel model) {
    return VariantEntity(
      id: model.id,
      title: model.title,
      price: model.calculatedPrice?.calculated_amount,
    );
  }
  static local.ProductResponseLocalModel toLocalModel(
      remote.ProductResponseModel model,
      ) {

    return local.ProductResponseLocalModel(

      products: model.products
          ?.map(
            (e) => local.ProductItemModels(
          e.id,
          e.title,
          e.subtitle,
          e.description,
          e.thumbnail,

          e.variants
              ?.map(
                (variant) => local.VariantModel(
              variant.id,
              variant.title,

                  local. CalculatedPriceModel(
                variant.calculatedPrice
                    ?.calculated_amount,
              ),
            ),
          )
              .toList(),
        ),
      )
          .toList(),

      count: model.count,
      offset: model.offset,
      limit: model.limit,
    );
  }
}
