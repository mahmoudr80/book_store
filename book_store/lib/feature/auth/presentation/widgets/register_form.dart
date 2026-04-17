import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/validators/auth_validation.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../gen/translations/local_keys.g.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key, required this.usernameController,
    required this.emailController, required this.passController,
    required this.confirmPassController, required this.formKey});
final TextEditingController usernameController;
final TextEditingController emailController;
final TextEditingController passController;
final TextEditingController confirmPassController;
final GlobalKey<FormState>formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUnfocus,
      key: formKey,
      child: Column(
        spacing: 11.h,
        children: [
          CustomTextFormField(
            hintText: LocaleKeys.auth_username.tr(),
            controller: usernameController,
            validators: (username) =>
                Validators.validateUsername(username),
          ),
          CustomTextFormField(
            hintText: LocaleKeys.auth_email.tr(),
            controller: emailController,
            validators: (email) =>
                Validators.validateEmail(email),
          ),
          CustomTextFormField(
            hintText: LocaleKeys.auth_password.tr(),
            controller: passController,
            secured: true,
            validators: (password) =>
                Validators.validatePassword(password),
          ),
          CustomTextFormField(
            hintText: LocaleKeys.auth_confirm_password.tr(),
            secured: true,
            validators: (confirmPassword) =>
                Validators.validateConfirmPassword(
                  confirmPassword,
                  passController.text,
                ),
            controller: confirmPassController,
          ),
        ],
      ),
    );
  }
}
