import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        decoration: BoxDecoration(image:DecorationImage(image:  Assets.images.welcomeBackground.image().image,fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [IconButton(
                    onPressed: () {
                      if(context.locale.languageCode=='ar'){
                        context.setLocale(Locale('en'));
                      }
                      else{
                        context.setLocale(Locale('ar'));
                      }
                    },
                    icon: Icon(Icons.language,size: 25.r,color: Colors.white,))],)
              ,Spacer(flex: 3,),
              Assets.images.splash.image(),
              SizedBox(height: 28.h,),
              Text(LocaleKeys.order_book_now.tr(),style: TextStyle(fontSize: 20.sp,),),

              Spacer(flex: 6,),
              AppButton(label: LocaleKeys.login.tr(),tapped: () => Navigator.pushNamed(context, RoutesScreens.loginScreen),),
              SizedBox(height: 15.h,),
              AppButton(label: LocaleKeys.auth_register.tr(),backColor: Colors.white,tapped: () => Navigator.pushNamed(context, RoutesScreens.registerScreen),),
              Spacer(flex: 1,),

              ],
          ),
        ),
      ),
    );
  }
}
