import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/validators/auth_validation.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../gen/translations/local_keys.g.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.emailController,
    required this.passController, required this.formKey});
final TextEditingController emailController;
final TextEditingController passController;
final GlobalKey<FormState>formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: LocaleKeys.auth_enter_email.tr(),
            controller: emailController,
            keyboardType:TextInputType.emailAddress ,
            validators: (email) =>
                Validators.validateEmail(email),
          ),
          SizedBox(height: 15.h),
          CustomTextFormField(
            hintText: LocaleKeys.auth_enter_password.tr(),
            secured: true,
            controller: passController,
            validators: (pass) =>
                Validators.validatePassword(pass),
          ),
        ],
      ),
    );
  }
}
