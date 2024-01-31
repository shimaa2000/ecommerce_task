import 'package:dio/dio.dart';
import 'package:ecommerce/home/data/data_source/home_data_source.dart';
import 'package:ecommerce/home/data/repository/home_repository.dart';
import 'package:ecommerce/home/domain/repository/base_home_repository.dart';
import 'package:ecommerce/home/domain/use_case/get_home_data_use_case.dart';
import 'package:get_it/get_it.dart';

import 'dio_services.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //Dio
    sl.registerSingleton<DioService>(
      DioService(
        dio: Dio(),
      ),
    );

    ///USE CASES
    sl.registerLazySingleton(() => GetHomeDataUseCase(sl()));

    ///REPOSITORY
    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));

    ///REMOTE DATA SOURCE
    sl.registerLazySingleton<BaseHomeDataSource>(() => HomeDataSource(sl()));
  }
}
