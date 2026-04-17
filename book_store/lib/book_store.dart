import 'package:book_store/core/dependency_injection/service_locator.dart';
import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/session/session_manager.dart';
import 'package:book_store/feature/welcome/presentation/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'feature/navigation/navigation_screen.dart';

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

        home: FutureBuilder(future: startScreen(),
            builder:(context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              if(snapshot.hasError){
                return const Scaffold(
                  body: Center(child: Text('Something went wrong')),
                );
              }
              return snapshot.data!;
            },),
      ),
    );
  }
  Future<Widget> startScreen() async {
    SessionManager manager =getIt<SessionManager>();
    String ? token = await manager.getToken();
    String ?userJson = manager.getUser();
    if(userJson!=null&&token!= null){
      return NavigationScreen();

    } else{
      return WelcomeScreen();
    }
  }
}
///look at it extenstion in dart & onGenerateRoute
