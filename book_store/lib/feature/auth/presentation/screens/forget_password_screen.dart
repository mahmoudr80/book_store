import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/core/widgets/customTextRich.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_back_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60.w,
        leading: CustomBackButton(tapped: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 22.w,vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.Forgot_Password.tr(),style:AppTextStyle.headlineStyle ,),
              Spacer(flex: 1,),
              Text(LocaleKeys.message_forget_password.tr(),style:AppTextStyle.hintStyle ,),
              Spacer(flex: 3,),
              CustomTextFormField(hintText: LocaleKeys.auth_enter_email.tr()),
              Spacer(flex: 4,),
              AppButton(label: LocaleKeys.auth_enter_password.tr()),
              Spacer(flex: 36,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Customtextrich(textButton: LocaleKeys.login.tr(),
                    textTitle: LocaleKeys.Remember_Password.tr(),
                    tapped:() => Navigator.pushNamedAndRemoveUntil(context,  RoutesScreens.welcomeScreen  ,(route) => false,) ,),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }


}
