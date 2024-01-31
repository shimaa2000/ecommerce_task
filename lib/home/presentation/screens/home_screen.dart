import 'package:ecommerce/core/component/error_screen.dart';
import 'package:ecommerce/core/component/no_internet_screen.dart';
import 'package:ecommerce/core/utils/enums.dart';
import 'package:ecommerce/home/presentation/components/custom_container_with_shadow.dart';
import 'package:ecommerce/home/presentation/components/sllider_container.dart';
import 'package:ecommerce/home/presentation/logic/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/managers/color_manager.dart';
import '../../../core/managers/style_manager.dart';
import '../../../core/services/service_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => HomeCubit(sl())..getHomeData(),
        lazy: false,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              body: switch (state.internetState) {
                InternetState.connected => switch (state.homeState) {
                    RequestState.loaded => Padding(
                        padding: EdgeInsets.all(width * .06),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child:
                                      SliderContainer(banners: state.banners)),
                              SizedBox(
                                height: width * .02,
                              ),
                              Text(
                                'New Items',
                                style: getSemiBoldStyle(
                                  color: ColorManager.darkColor.withOpacity(.5),
                                  fontSize: width * .05,
                                ),
                              ),
                              SizedBox(
                                height: width * .02,
                              ),
                              Expanded(
                                flex: 5,
                                child: GridView.builder(
                                  itemCount: state.products.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  itemBuilder: (_, int index) {
                                    return GridTile(
                                      child: CustomContainerWithShadow(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                                state.products[index].image),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            height: 15,
                                            width: width * .4,
                                            child: Text(
                                              state.products[index].name,
                                              overflow: TextOverflow.ellipsis,
                                              style: getSemiBoldStyle(
                                                color: ColorManager.darkColor,
                                                fontSize: width * .03,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              if (state.products[index]
                                                      .discount !=
                                                  0)
                                                Text(
                                                  '\$${state.products[index].oldPrice}',
                                                  style:
                                                      getThroghlineMeduimStyle(
                                                    color:
                                                        ColorManager.greyShade,
                                                    fontSize: width * .025,
                                                  ),
                                                ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '\$${state.products[index].price}',
                                                style: getRegularStyle(
                                                  color: ColorManager.redColor,
                                                  fontSize: width * .025,
                                                ),
                                              ),
                                              const Spacer(),
                                              Icon(
                                                size: 20,
                                                state.products[index]
                                                        .isFavorites
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: state.products[index]
                                                        .isFavorites
                                                    ? ColorManager.redColor
                                                    : ColorManager.greyShade,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    RequestState.error => ErrorScreen(
                        onPressed: () =>
                            context.read<HomeCubit>().getHomeData(),
                        error: 'Error',
                      ),
                    (_) => const CupertinoActivityIndicator(),
                  },
                InternetState.disconnect => const NoInternetScreen(),
              },
            );
          },
        ),
      ),
    );
  }
}
