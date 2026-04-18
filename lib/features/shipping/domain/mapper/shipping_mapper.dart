import '../../data/models/shipping_model.dart';
import '../entities/shipping_entites.dart';

class ShippingMapper {
  static ShippingEntity toEntity(ShippingResponseModel model) {
    return ShippingEntity(
      options: model.options.map((option) {
        return ShippingOptionEntity(
          id: option.id,
          name: option.name,
          amount: option.calculatedPrice?.amount ?? option.amount,
          currencyCode: option.calculatedPrice?.currencyCode,
          description: option.type?.description,
          type: option.type?.code,
          isTaxInclusive: option.isTaxInclusive ?? false,
        );
      }).toList(),
    );
  }
}