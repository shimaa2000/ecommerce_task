import 'package:equatable/equatable.dart';

import 'banners.dart';
import 'products.dart';

class HomeData extends Equatable {
  const HomeData({
    required this.status,
    required this.banners,
    required this.products,
  });

  final bool status;
  final List<Banners> banners;
  final List<Products> products;

  @override
  List<Object> get props => [status, banners, products];
}
