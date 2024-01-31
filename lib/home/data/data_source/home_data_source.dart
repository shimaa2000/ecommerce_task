import 'dart:developer';

import '../../../core/constants/api_constance.dart';
import '../../../core/services/dio_services.dart';
import '../models/home_model.dart';

abstract class BaseHomeDataSource {
  Future<HomeModel> getHomeData();
}

class HomeDataSource extends BaseHomeDataSource {
  DioService dioService;

  HomeDataSource(this.dioService);

  @override
  Future<HomeModel> getHomeData() async {
    final response = await dioService.get(
      url: ApiConstance.home,
    );
    log(response.data.toString());
    return HomeModel.fromJson(response.data);
  }
}
