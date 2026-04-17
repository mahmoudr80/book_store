import 'package:book_store/feature/auth/presentation/screens/forget_password_screen.dart';
import 'package:book_store/feature/auth/presentation/screens/login_screen.dart';
import 'package:book_store/feature/auth/presentation/screens/register_screen.dart';
import 'package:book_store/feature/cart/presentation/screens/congrats_screen.dart';
import 'package:book_store/feature/cart/presentation/screens/place_order_screen.dart';
import 'package:book_store/feature/home/data/repository/home_repository.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/screens/book_details_screen.dart';
import 'package:book_store/feature/profile/data/repository/profile_repository.dart';
import 'package:book_store/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:book_store/feature/profile/presentation/screens/my_order_screen.dart';
import 'package:book_store/feature/profile/presentation/screens/update_password_screen.dart';
import 'package:book_store/feature/profile/presentation/screens/update_profile_screen.dart';
import 'package:book_store/feature/welcome/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/cart/data/repository/home_repository.dart';
import '../../feature/cart/domain/usecase/getCartProductsUseCase.dart';
import '../../feature/cart/presentation/cubit/cart_cubit.dart';
import '../../feature/home/data/models/product_model.dart';
import '../../feature/home/presentaion/screens/search_screen.dart';
import '../../feature/navigation/navigation_screen.dart';
import '../dependency_injection/service_locator.dart';

abstract class RoutesScreens {
  static const String loginScreen = "/login_screen";
  static const String registerScreen = "/register_screen";
  static const String forgetPasswordScreen = "/forget_password_screen";
  static const String welcomeScreen = "/welcome_screen";
  static const String bookDetailScreen = "/book_details_screen";
  static const String searchScreen = "/search_screen";
  static const String placeOrderScreen = "/place_order_screen";
  static const String congratsScreen = "/congrats_screen";
  static const String navigationScreen = "/navigation_screen";
  static const String updatePasswordScreen = "/update_password_screen";
  static const String updateProfileScreen = "/update_profile_screen";
  static const String myOrderScreen = "/my_order_screen";
}

Route<dynamic>? generateRoutes(RouteSettings route) {
  switch (route.name) {
    case RoutesScreens.registerScreen:
      return MaterialPageRoute(builder: (_) => RegisterScreen(),);
    case RoutesScreens.loginScreen:
      return MaterialPageRoute(builder: (_) => LoginScreen(),);
    case RoutesScreens.updatePasswordScreen:
      return MaterialPageRoute(builder: (_) => UpdatePasswordScreen(),);
    case RoutesScreens.myOrderScreen:
      return MaterialPageRoute(builder: (_) => MyOrderScreen(),);
    case RoutesScreens.updateProfileScreen:
      return MaterialPageRoute(builder: (_) => BlocProvider(
  create: (context) => ProfileCubit(getIt<ProfileRepository>())..getUser(),
  child: UpdateProfileScreen(),
),);
    case RoutesScreens.forgetPasswordScreen:
      return MaterialPageRoute(builder: (_) => ForgetPasswordScreen(),);
    case RoutesScreens.welcomeScreen:
      return MaterialPageRoute(builder: (_) => WelcomeScreen(),);
    case RoutesScreens.congratsScreen:
      return MaterialPageRoute(builder: (_) => CongratsScreen(),);
    case RoutesScreens.navigationScreen:
      return MaterialPageRoute(builder: (_) => NavigationScreen(),);
    case RoutesScreens.placeOrderScreen:
      return MaterialPageRoute(builder: (_) =>BlocProvider(create: (context) =>
  CartCubit(GetCartProductsUseCase(getIt<CartRepositoryImpl>()))..getCartProducts(),
  child: PlaceOrderScreen(),));
    case RoutesScreens.searchScreen:
      return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => HomeCubit(
            getIt<HomeRepository>(),
         //   searchUseCase: SearchUseCase(getIt<HomeRepository>()),
          ),
          child: SearchScreen()),);
    case RoutesScreens.bookDetailScreen:
      final book = route.arguments as BookModel;
      return MaterialPageRoute(builder: (_) => BookDetailsScreen(bookModel: book,),);
    default :
      return null;
  }
}