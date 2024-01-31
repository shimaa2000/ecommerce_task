import 'package:equatable/equatable.dart';

class Banners extends Equatable {
  const Banners({required this.image, required this.id});

  final String image;
  final int id;

  @override
  List<Object> get props => [image, id];
}
