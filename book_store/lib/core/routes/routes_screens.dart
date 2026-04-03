import 'package:book_store/feature/auth/data/models/user_model.dart';
import 'package:book_store/feature/auth/presentation/screens/forget_password_screen.dart';
import 'package:book_store/feature/auth/presentation/screens/login_screen.dart';
import 'package:book_store/feature/auth/presentation/screens/register_screen.dart';
import 'package:book_store/feature/home/data/repository/home_repository.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/home_screen.dart';
import 'package:book_store/feature/welcome/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dependency_injection/service_locator.dart';

abstract class RoutesScreens {
  static const String loginScreen = "/login_screen";
  static const String registerScreen = "/register_screen";
  static const String homeScreen = "/home_screen";
  static const String forgetPasswordScreen = "/forget_password_screen";
  static const String welcomeScreen = "/welcome_screen";
}

Route<dynamic>? generateRoutes(RouteSettings route) {
  switch (route.name) {
    case RoutesScreens.homeScreen:
      return MaterialPageRoute(builder: (_) =>
          HomeScreen(),);
    case RoutesScreens.registerScreen:
      return MaterialPageRoute(builder: (_) => RegisterScreen(),);
    case RoutesScreens.loginScreen:
      return MaterialPageRoute(builder: (_) => LoginScreen(),);
    case RoutesScreens.forgetPasswordScreen:
      return MaterialPageRoute(builder: (_) => ForgetPasswordScreen(),);
    case RoutesScreens.welcomeScreen:
      return MaterialPageRoute(builder: (_) => WelcomeScreen(),);
    default :
      return null;
  }
}