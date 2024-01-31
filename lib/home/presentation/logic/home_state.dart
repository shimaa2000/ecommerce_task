part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.homeState = RequestState.initial,
    this.internetState = InternetState.connected,
    this.banners = const [],
    this.products = const [],
  });

  final RequestState homeState;
  final InternetState internetState;
  final List<Banners> banners;
  final List<Products> products;

  HomeState copyWith({
    RequestState? homeState,
    InternetState? internetState,
    List<Banners>? banners,
    List<Products>? products,
  }) =>
      HomeState(
        homeState: homeState ?? this.homeState,
        banners: banners ?? this.banners,
        products: products ?? this.products,
        internetState: internetState?? this.internetState,
      );

  @override
  List<Object> get props => [
        homeState,
    internetState,
        banners,
        products,
      ];
}
