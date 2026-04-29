import 'package:book_store/core/helper/app_constants.dart';
import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/feature/cart/presentation/screens/cart_screen.dart';
import 'package:book_store/feature/home/presentaion/screens/home_screen.dart';
import 'package:book_store/feature/navigation/cubit/navigation_cubit.dart';
import 'package:book_store/feature/wish_list/presentation/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/dependency_injection/service_locator.dart';
import '../../gen/assets.gen.dart';
import '../cart/data/repository/home_repository.dart';
import '../cart/domain/usecase/getCartProductsUseCase.dart';
import '../cart/domain/usecase/remove_item_usecase.dart';
import '../cart/domain/usecase/updateCartItemUseCase.dart';
import '../cart/presentation/cubit/cart_cubit.dart';
import '../cart/presentation/screens/place_order_screen.dart';
import '../home/data/repository/home_repository.dart';
import '../home/presentaion/cubit/home_cubit.dart';
import '../profile/presentation/screens/profile_screen.dart';


class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NavigationCubit,NavigationState>
      (builder: (BuildContext context, NavigationState state) {
      return Scaffold(
        body: SafeArea(child: _buildScreen()),
        bottomNavigationBar:BottomNavigationBar(
            onTap: (value) {
             context.read<NavigationCubit>().navigate(value);
            },
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(icon: SvgPicture.asset(Assets.icons.home,
                colorFilter:ColorFilter.mode(currentIndex==0?AppColor.primaryColor:Colors.black, BlendMode.srcIn)  ,),label: ''),
              BottomNavigationBarItem(icon: SvgPicture.asset(Assets.icons.bookmark,
                colorFilter:ColorFilter.mode(currentIndex==1?AppColor.primaryColor:Colors.black, BlendMode.srcIn)  ,),label: ''),
              BottomNavigationBarItem(icon: SvgPicture.asset(Assets.icons.group,
                colorFilter:ColorFilter.mode(currentIndex==2?AppColor.primaryColor:Colors.black, BlendMode.srcIn)  ,),label: '') ,
              BottomNavigationBarItem(icon: SvgPicture.asset(Assets.icons.profile,
                colorFilter:ColorFilter.mode(currentIndex==3?AppColor.primaryColor:Colors.black, BlendMode.srcIn)  ,),label: '')
            ]),

      );
    },
    );
  }
}


Widget _buildScreen() {
  switch (currentIndex) {
    case 0:
      return BlocProvider(
        create: (_) => HomeCubit(getIt<HomeRepository>())
          ..getSliders()
          ..getBestSeller()
          ..getAllProducts(),
        child: HomeScreen(),
      );

    case 1:
      return WishListScreen();

    case 2:
      return BlocProvider(
        create: (_) =>
  CartCubit(getCartProductsUseCase:  GetCartProductsUseCase(getIt<CartRepositoryImpl>()),
  updateCartItemUseCase: UpdateCartItemUseCase(getIt<CartRepositoryImpl>())
  ,removeItemUseCase: RemoveItemUseCase(getIt<CartRepositoryImpl>()))..getCartProducts(),
        child: CartScreen(),
      );

    case 3:
      return ProfileScreen();

    default:
      return SizedBox();
  }
}
