import 'package:ecommerce/home/domain/entity/banners.dart';

class BannerModel extends Banners {
  const BannerModel({
    required super.image,
    required super.id,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      image: json['image'],
      id: json['id'],
    );
  }
}
