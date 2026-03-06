import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/core/widgets/customTextRich.dart';
import 'package:book_store/core/widgets/custom_text_button.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/feature/auth/presentation/widgets/sign_in_widget.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container(width:41.r,height:41.r,decoration :BoxDecoration(color: Colors.white
      ,borderRadius: BorderRadius.circular(12.r),border: Border.all(color: AppColor.primaryTextFormBorderColor)),child: IconButton(onPressed: () {
        back(context);} , icon:Icon(Icons.arrow_back_ios)),),),
    body: SafeArea(
      child: Padding(
        padding:  EdgeInsets.only(top: 11.h,bottom: 19.h,left: 22.w,right: 22.w),
        child: Column(
          children: [
            Spacer(flex: 4,),
            Container(
                padding: EdgeInsets.only(right: 73.w),
                child: Text(LocaleKeys.auth_welcome_back.tr(),style: Theme.of(context).textTheme.headlineLarge,)),
            Spacer(flex: 4,),
            CustomTextFormField(hintText: LocaleKeys.auth_enter_email.tr()),
            Spacer(flex: 1,),
            CustomTextFormField(hintText: LocaleKeys.auth_enter_password.tr(),secured: true,),
            Spacer(flex: 1,), 
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Customtextrich(textButton:LocaleKeys.auth_forgot_password.tr()),
              ],
            ),
            Spacer(flex: 4,),
            AppButton(label: LocaleKeys.login.tr()),
            Spacer(flex: 4,),
            Container(width: 331.w,height: 167.h,child: SignInWidget(),),
            Spacer(flex: 12,),
            Customtextrich(textTitle: LocaleKeys.auth_no_account.tr(), textButton:LocaleKeys.auth_register_now.tr(),tapped: () {debugPrint('tapped');},)

          ],
        ),
      ),
    ),
    );
  }

  void back(BuildContext context) {
    Navigator.pop(context);
  }
}