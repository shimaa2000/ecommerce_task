import 'package:ecommerce/home/domain/entity/products.dart';

class ProductModel extends Products {
  const ProductModel({
    required super.id,
    required super.image,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.name,
    required super.isFavorites,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      isFavorites: json['in_favorites'],
      id: json['id'],
      image: json['image'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      name: json['name'],
    );
  }
}
