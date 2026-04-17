import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

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
                      SvgPicture.asset(Assets.images.verifiedIcon,height: 100.h,
                      width: 100.w,fit: BoxFit.fill,),
                      SizedBox(height: 35.h,),
                      Text("SUCCESS!",
                        style:AppTextStyle.headlineStyle.copyWith(fontSize: 45.sp)),
                      SizedBox(height: 3.h,),
                      Text("Your order will be delivered soon. Thank you for choosing our app!",
                        style: AppTextStyle.hintStyle,textAlign: TextAlign.center,),

                    ],
                  ),
                ),

                AppButton(label: "Back To Home",
                  tapped:() => Navigator.pushNamedAndRemoveUntil(context, RoutesScreens.navigationScreen,(route) => false,) ,),
                Spacer(),
              ],
            ),
          )),
    );
  }
}
