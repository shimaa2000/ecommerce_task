import 'package:equatable/equatable.dart';

class Products extends Equatable {
  const Products({
    required this.id,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.name,
    required this.isFavorites,
  });

  final int id;
  final bool isFavorites;
  final String image;
  final String name;
  final num price;
  final num oldPrice;
  final int discount;

  @override
  List<Object> get props => [id, image, price, oldPrice, discount, name];
}
