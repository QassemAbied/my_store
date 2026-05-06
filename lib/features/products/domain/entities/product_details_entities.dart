class ProductDetailsEntities {
  final ProductEntities product;

  ProductDetailsEntities({required this.product});
}

class ProductEntities {
  final String id;
  final String title;
  final String description;
  final String thumbnail;
  final CollectionEntities? collection;
  final List<CategoryEntities> categories;
  final List<ImageEntities> images;
  final List<OptionEntities> options;
  final List<ProductVariantEntities> variants;

  ProductEntities({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.collection,
    required this.categories,
    required this.images,
    required this.options,
    required this.variants,
  });
}

class CollectionEntities {
  final String title;

  CollectionEntities({required this.title});
}

class CategoryEntities {
  final String name;

  CategoryEntities({required this.name});
}

class ImageEntities {
  final String url;

  ImageEntities({required this.url});
}

class OptionEntities {
  final String title;
  final List<ValueEntities> values;

  OptionEntities({required this.title, required this.values});
}

class ValueEntities {
  final String value;

  ValueEntities({required this.value});
}

class ProductVariantEntities {
  final String id;
  final String title;
  final String sku;
  final bool manageInventory;
  final List<ValueEntities> options;

  ProductVariantEntities({
    required this.id,
    required this.title,
    required this.sku,
    required this.manageInventory,
    required this.options,
  });
}
