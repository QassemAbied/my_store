import '../../data/models/regions_model.dart';
import '../entities/regions_entities.dart';

class RegionMapper {
  static List<RegionEntity> toEntityList(RegionResponseModel model) {
    return model.regions.map((e) => _toEntity(e)).toList();
  }

  static RegionEntity _toEntity(RegionModel model) {
    return RegionEntity(
      id: model.id,
      name: model.name,
      currencyCode: model.currencyCode,
      countries: model.countries
          .map((e) => CountryEntity(name: e.displayName))
          .toList(),
    );
  }
}
