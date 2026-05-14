import 'package:hive_ce_flutter/adapters.dart';

part 'category_local_model.g.dart';

@HiveType(typeId: 4)
class CategoryResponseLocalModel extends HiveObject {

  @HiveField(0)
  final List<CategoryLocalModel> categories;

  CategoryResponseLocalModel({
    required this.categories,
  });
}

@HiveType(typeId: 5)
class CategoryLocalModel extends HiveObject {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final String handle;

  @HiveField(4)
  final String? parentCategoryId;

  CategoryLocalModel({
    required this.id,
    required this.name,
    this.description,
    required this.handle,
    this.parentCategoryId,
  });
}