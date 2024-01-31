import 'package:ecommerce/core/utils/enums.dart';
import 'package:ecommerce/home/domain/use_case/get_home_data_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/component/show_error_toast.dart';
import '../../../core/services/network_service.dart';
import '../../domain/entity/banners.dart';
import '../../domain/entity/products.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getHomeDataUseCase) : super(const HomeState()) {
    NetworkService().addListener((status) {
      if (status.disconnected) {
        emit(state.copyWith(internetState: InternetState.disconnect));
      }
      if (status.connected) {
        emit(state.copyWith(internetState: InternetState.connected));
        //call methods
      }
    });
  }

  final GetHomeDataUseCase _getHomeDataUseCase;

  void getHomeData() async {
    if (await NetworkService().isConnected) {
      emit(state.copyWith(
        homeState: RequestState.loading,
      ));
      final result = await _getHomeDataUseCase();
      result.fold((l) {
        showErrorToast(l.message);
        emit(state.copyWith(
          homeState: RequestState.error,
        ));
      }, (r) {
        emit(state.copyWith(
          homeState: RequestState.loaded,
          products: r.products,
          banners: r.banners,
        ));
      });
    } else {
      emit(state.copyWith(internetState: InternetState.disconnect));
    }
  }
}
