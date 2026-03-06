import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/widgets/customTextRich.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              Spacer(flex: 3,),
              Container(
                  padding: EdgeInsets.only(right: 73.w),
                  child: Text(LocaleKeys.auth_register_greeting.tr(),style: Theme.of(context).textTheme.headlineLarge,)),
              Spacer(flex: 3,),
              CustomTextFormField(hintText: LocaleKeys.auth_username.tr()),
              Spacer(flex: 1,),
              CustomTextFormField(hintText: LocaleKeys.auth_email.tr()),
              Spacer(flex: 1,),
              CustomTextFormField(hintText: LocaleKeys.auth_password.tr(),secured: true,),
              Spacer(flex: 1,),
              CustomTextFormField(hintText: LocaleKeys.auth_confirm_password.tr(),secured: true,),
              Spacer(flex: 3,),
              AppButton(label: LocaleKeys.auth_register.tr()),
              Spacer(flex: 18,),
              Customtextrich(textTitle: LocaleKeys.auth_already_have_account.tr(), textButton:LocaleKeys.auth_login_now.tr(),tapped: () {debugPrint('tapped');},)

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
