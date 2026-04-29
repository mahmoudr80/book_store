import 'package:bloc/bloc.dart';
import 'package:book_store/feature/cart/domain/usecase/remove_item_usecase.dart';
import 'package:book_store/feature/cart/domain/usecase/updateCartItemUseCase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/dependency_injection/service_locator.dart';
import '../../cart/data/repository/home_repository.dart';
import '../../cart/domain/usecase/getCartProductsUseCase.dart';
import '../../cart/presentation/cubit/cart_cubit.dart';
import '../../cart/presentation/screens/cart_screen.dart';
import '../../home/data/repository/home_repository.dart';
import '../../home/presentaion/cubit/home_cubit.dart';
import '../../home/presentaion/screens/home_screen.dart';
import '../../profile/presentation/screens/profile_screen.dart';
import '../../wish_list/presentation/wish_list_screen.dart';

part 'navigation_state.dart';
int currentIndex=0;
List<Widget>screens=[
  BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepository>())
        ..getSliders()
        ..getBestSeller()
        ..getAllProducts(),child: HomeScreen()),
  WishListScreen(),
  BlocProvider(create: (context) =>
  CartCubit(getCartProductsUseCase:  GetCartProductsUseCase(getIt<CartRepositoryImpl>()),
  updateCartItemUseCase: UpdateCartItemUseCase(getIt<CartRepositoryImpl>())
  ,removeItemUseCase: RemoveItemUseCase(getIt<CartRepositoryImpl>()))..getCartProducts(),
      child: CartScreen()),
  ProfileScreen()
];
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  void navigate(int index){
    switch(index){
      case 0:
        currentIndex=0;
        emit(NavigationInitial());
      case 1:
        currentIndex=1;
        emit(NavigationWishList());
      case 2:
        currentIndex=2;
        emit(NavigationCart());
      case 3:
        currentIndex=3;
        emit(NavigationProfile());
      default:
        currentIndex=0;
    emit(NavigationInitial());
    }
  }
}
