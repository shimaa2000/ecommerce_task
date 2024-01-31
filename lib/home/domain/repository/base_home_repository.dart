import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/home/domain/entity/home_data.dart';

abstract class BaseHomeRepository{
  Future<Either<Failure ,HomeData>> getHomeData();
}