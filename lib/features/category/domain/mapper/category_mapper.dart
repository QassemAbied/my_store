import 'package:my_store/features/category/data/models/category_model.dart';
import 'package:my_store/features/category/domain/entities/category_entities.dart';

class CategoryMapper {
  static CategoryEntities toEntity(CategoryModel model) {
    return CategoryEntities(
      id: model.id,
      name: model.name,
      description: model.description,
    );
  }

  static List<CategoryEntities> toEntityList(CategoryResponseModel response) {
    return response.categories.map((e) => toEntity(e)).toList();
  }
}
