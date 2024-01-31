import 'package:dartz/dartz.dart';
import 'package:ecommerce/home/domain/repository/base_home_repository.dart';

import '../../../core/errors/failure.dart';
import '../entity/home_data.dart';

class GetHomeDataUseCase {
  final BaseHomeRepository homeRepository;

  GetHomeDataUseCase(this.homeRepository);

  Future<Either<Failure, HomeData>> call() => homeRepository.getHomeData();
}
