import 'dart:convert';

import 'package:book_store/core/dependency_injection/service_locator.dart';
import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/session/session_manager.dart';
import 'package:book_store/core/storage/local_storage_service.dart';
import 'package:book_store/core/storage/secure_storage_service.dart';
import 'package:book_store/feature/auth/presentation/screens/create_new_password_screen.dart';
import 'package:book_store/feature/auth/presentation/screens/otp_verification_screen.dart';
import 'package:book_store/feature/auth/presentation/screens/password_changed_screen.dart';
import 'package:book_store/feature/buttom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:book_store/feature/welcome/presentation/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/helper/app_constants.dart';
import 'feature/auth/data/models/user_model.dart';
import 'feature/home/presentaion/home_screen.dart';

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        onGenerateRoute: generateRoutes,
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.white,),
            fontFamily: "DM",
            scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,

        home: BottomNavBarScreen()


        // FutureBuilder(future: startScreen(),
        //     builder:(context, snapshot) {
        //       if(snapshot.connectionState==ConnectionState.waiting){
        //         return const Scaffold(
        //           body: Center(child: CircularProgressIndicator()),
        //         );
        //       }
        //       if(snapshot.hasError){
        //         return const Scaffold(
        //           body: Center(child: Text('Something went wrong')),
        //         );
        //       }
        //       return snapshot.data!;
        //     },),
      ),
    );
  }
  Future<Widget> startScreen() async {
    SessionManager manager =getIt<SessionManager>();
    String ? token = await manager.getToken();
    String ?userJson = manager.getUser();
    if(userJson!=null){
      final user = UserModel.fromJson(jsonDecode( manager.getUser()!));
      if( token== null){
        return WelcomeScreen();
      }
      else{
        return HomeScreen();
      }
    } else{
      return WelcomeScreen();
    }
  }
}
///look at it extenstion in dart & onGenerateRoute
