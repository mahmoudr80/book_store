import 'package:book_store/core/helper/app_constants.dart';
import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/feature/cart/presentation/screens/cart_screen.dart';
import 'package:book_store/feature/home/presentaion/screens/home_screen.dart';
import 'package:book_store/feature/wish_list/presentation/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/dependency_injection/service_locator.dart';
import '../../gen/assets.gen.dart';
import '../cart/data/repository/home_repository.dart';
import '../cart/domain/usecase/getCartProductsUseCase.dart';
import '../cart/presentation/cubit/cart_cubit.dart';
import '../cart/presentation/screens/place_order_screen.dart';
import '../profile/presentation/screens/profile_screen.dart';
 List<Widget>screens = [HomeScreen(),WishListScreen(),
BlocProvider(create: (context) =>
CartCubit(GetCartProductsUseCase(getIt<CartRepositoryImpl>()))..getCartProducts(),
  child: CartScreen()),ProfileScreen()];
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 3 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar:BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex =value;
            });
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
  }
}

