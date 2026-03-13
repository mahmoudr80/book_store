import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/core/widgets/custom_back_button.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(tapped: () => Navigator.pop(context)),
        leadingWidth: 60.w,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 22.w,
            vertical: 28.h,
          ),
          child: Column(
            children: [
              Text(LocaleKeys.title_create_password.tr(),style: AppTextStyle.headlineStyle,),
              Spacer(flex: 1,),
              Text(LocaleKeys.description_new_password.tr(),style: AppTextStyle.hintStyle,),
              Spacer(flex: 3,),
              CustomTextFormField(hintText: LocaleKeys.new_password_label.tr()),
              Spacer(flex: 1,),
              CustomTextFormField(hintText: LocaleKeys.confirm_password_label.tr()),
              Spacer(flex: 4,),
              AppButton(label: LocaleKeys.reset_password_button.tr(),tapped: () {},),
              Spacer(flex: 34,)
            ],
          ),
        ),
      ),
    );
  }
}
