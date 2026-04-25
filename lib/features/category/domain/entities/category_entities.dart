class CategoryEntities {
  final String id;
  final String name;
  final String? description;

  CategoryEntities({
    required this.id,
    required this.name,
    this.description,
  });
}