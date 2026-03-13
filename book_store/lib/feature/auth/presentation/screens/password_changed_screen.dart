import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              spacing: 40.h,
              children: [
                Spacer(),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 50.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/verifiedIcon.svg',height: 100.h,
                      width: 100.w,fit: BoxFit.fill,),
                      SizedBox(height: 35.h,),
                      Text(LocaleKeys.title_password_changed.tr(),style: TextStyle(fontSize: 26.sp,color: Color(0xff2F2F2F)),),
                      SizedBox(height: 3.h,),
                      Text(LocaleKeys.password_changed_successfully.tr(),
                        style: AppTextStyle.hintStyle,textAlign: TextAlign.center,),

                    ],
                  ),
                ),

                AppButton(label: LocaleKeys.back_to_login_button.tr(),
                  tapped:() => Navigator.pushReplacementNamed(context, RoutesScreens.loginScreen) ,),
                Spacer(),
              ],
            ),
          )),
    );
  }
}
