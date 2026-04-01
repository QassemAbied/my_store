


class ProductEntities {
 final List<Products>? products;
 final int? count;
 final int? offset;
 final int? limit;

  ProductEntities({this.products, this.count, this.offset, this.limit});


}

class Products {
  final String? id;
  final  String? title;
  final String? subtitle;
  final  String? description;
  final  String? handle;
  final bool? isGiftcard;
  final bool? discountable;
  final String? thumbnail;
  final String? collectionId;
  final String? weight;
  final  String? createdAt;
  final String? updatedAt;
  final  Collection? collection;
  final List<Options1>? options;
  final List<Images>? images;
  final List<Variants>? variants;

  Products(
      {this.id,
        this.title,
        this.subtitle,
        this.description,
        this.handle,
        this.isGiftcard,
        this.discountable,
        this.thumbnail,
        this.collectionId,
        this.createdAt,
        this.updatedAt,
        this.collection,
        this.options,
        this.images,
        this.variants,
        this.weight});

}

class Collection {
  final String? id;
  final String? title;
  final String? handle;

  final String? createdAt;
  final String? updatedAt;


  Collection(
      {this.id,
        this.title,
        this.handle,

        this.createdAt,
        this.updatedAt,
       });


}

class Options1 {
  final String? id;
  final String? title;
  final String? productId;
  final  String? createdAt;
  final  String? updatedAt;
  final List<Values>? values;

  Options1(
      {this.id,
        this.title,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.values});


}

class Values {
  final  String? id;
  final String? value;
  final  String? optionId;
  final String? createdAt;
  final String? updatedAt;


  Values(
      {this.id,
        this.value,
        this.optionId,
        this.createdAt,
        this.updatedAt,
      });


}

class Images {
 final String? id;
 final String? url;
 final int? rank;
 final String? productId;
 final String? createdAt;
 final String? updatedAt;


  Images(
      {this.id,
        this.url,
        this.rank,
        this.productId,
        this.createdAt,
        this.updatedAt,
        });


}

class Variants {
  final String? id;
  final  String? title;
  final String? sku;
  final bool? allowBackorder;
  final  bool? manageInventory;
  final int? variantRank;
  final String? productId;
  final String? createdAt;
  final String? updatedAt;
  final List<Options>? options;

  Variants(
      {this.id,
        this.title,
        this.sku,
        this.allowBackorder,
        this.manageInventory,
        this.variantRank,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.options});


}

class Options {
  final String? id;
  final String? value;
  final String? optionId;
  final Option? option;
  final  String? createdAt;
  final String? updatedAt;


  Options(
      {this.id,
        this.value,

        this.optionId,
        this.option,
        this.createdAt,
        this.updatedAt,
       });


}

class Option {
  final String? id;
  final String? title;
  final String? productId;
  final String? createdAt;
  final String? updatedAt;


  Option(
      {this.id,
        this.title,
        this.productId,
        this.createdAt,
        this.updatedAt,
        });


}