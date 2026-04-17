import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/core/widgets/custom_back_button.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: CustomBackButton(tapped: () => Navigator.pop(context)),
        ),
        leadingWidth: 70.w,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 22.w,
            vertical: 28.h,
          ),
          child: Column(
            spacing: 26.h,
            children: [
              Spacer(flex: 1),
              Text(LocaleKeys.title_create_password.tr(),style: AppTextStyle.headlineStyle,),
              Spacer(flex: 2),
              CustomTextFormField(hintText: LocaleKeys.new_password_label.tr()),
              CustomTextFormField(hintText: "Current Password",secured: true),
              CustomTextFormField(hintText: LocaleKeys.confirm_password_label.tr(),secured: true,),
              Spacer(flex: 12),
              AppButton(label:"Update Password",tapped: () {},),
            ],
          ),
        ),
      ),
    );
  }
}
