import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/home/data/data_source/home_data_source.dart';
import 'package:ecommerce/home/domain/entity/home_data.dart';
import 'package:ecommerce/home/domain/repository/base_home_repository.dart';

import '../../../core/errors/server_exception.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeDataSource _homeDataSource;

  HomeRepository(this._homeDataSource);

  @override
  Future<Either<Failure, HomeData>> getHomeData() async {
    try {
      final result = await _homeDataSource.getHomeData();
      log(result.toString());

      return Right(result);
    } on DioException catch (error) {
      return Left(ServerFailure.fromDioError(error));
    } on ServerException catch (failure) {
      log(failure.errorMessageModel.message);
      return Left(ServerFailure(failure.errorMessageModel.message));
    } catch (e) {
      return Left(
        ServerFailure.fromResponse(
          400,
          e.toString(),
          {'message': e.toString()},
        ),
      );
    }
  }
}
