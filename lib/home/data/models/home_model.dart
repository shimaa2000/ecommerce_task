import 'package:ecommerce/home/data/models/banner_model.dart';
import 'package:ecommerce/home/data/models/product_model.dart';
import 'package:ecommerce/home/domain/entity/home_data.dart';

class HomeModel extends HomeData {
  const HomeModel({
    required super.status,
    required super.banners,
    required super.products,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      banners: List.from(
        json['data']['banners'].map(
          (e) => BannerModel.fromJson(e),
        ),
      ),
      products: List.from(
        json['data']['products'].map(
          (e) => ProductModel.fromJson(e),
        ),
      ),
    );
  }
}
