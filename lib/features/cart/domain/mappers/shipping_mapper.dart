import '../../data/models/shipping_model.dart';
import '../entities/shipping_entites.dart';

class ShippingMapper {
  static ShippingEntity toEntity(ShippingResponseModel model) {
    return ShippingEntity(
      options: model.options.map((option) {
        return ShippingOptionEntity(
          id: option.id,
          name: option.name,
          amount: option.amount,
        );
      }).toList(),
    );
  }
}