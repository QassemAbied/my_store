import '../../data/models/category_local_model.dart';
import '../../data/models/category_model.dart';
import '../entities/category_entities.dart';

class CategoryLocalMapper {
  static CategoryEntities toCategoryEntity(CategoryLocalModel entity) {
    return CategoryEntities(
      id: entity.id,
      name: entity.name,
      description: entity.description,
    );
  }

  static List<CategoryEntities> toEntityList(
    CategoryResponseLocalModel entities,
  ) {
    return entities.categories.map((e) => toCategoryEntity(e)).toList();
  }

  static CategoryResponseLocalModel toLocalModel(CategoryResponseModel model) {
    return CategoryResponseLocalModel(
      categories: model.categories.map((e) {
        return CategoryLocalModel(
          id: e.id,
          name: e.name,
          description: e.description,
          handle: e.handle,
          parentCategoryId: e.parentCategoryId,
        );
      }).toList(),
    );
  }
}
