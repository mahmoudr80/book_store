import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/feature/auth/presentation/screens/create_new_password_screen.dart';
import 'package:book_store/feature/auth/presentation/screens/otp_verification_screen.dart';
import 'package:book_store/feature/auth/presentation/screens/password_changed_screen.dart';
import 'package:book_store/feature/welcome/presentation/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

        home: WelcomeScreen(),
      ),
    );
  }
}
///look at it extenstion in dart & onGenerateRoute
