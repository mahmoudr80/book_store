import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/utils/app_snackBar.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/core/widgets/custom_back_button.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  GlobalKey<FormState> key=GlobalKey<FormState>();
  TextEditingController currentPasswordController=TextEditingController();
  TextEditingController newPasswordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit,ProfileState>(
  listener: (context, state) {
    if(state is ResetPasswordSuccess){
      AppSnackbar.showSuccess(context,LocaleKeys.password_updated_success.tr());
      Navigator.pop(context);
    }
  },
  child: Scaffold(
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
          child:  SingleChildScrollView(
            child: Column(
              spacing: 30.h,
              children: [
                Text(LocaleKeys.title_create_password.tr(),style: AppTextStyle.headlineStyle,),
                Form(
                    key: key,
                    child: Column(
                      spacing: 15.h,
                  children: [
                     CustomTextFormField(hintText: LocaleKeys.current_password_hint.tr(),secured: true,controller: currentPasswordController,),
                    CustomTextFormField(hintText: LocaleKeys.new_password_label.tr(),secured: true,controller: newPasswordController,),
                    CustomTextFormField(hintText: LocaleKeys.confirm_password_label.tr(),secured: true,controller: confirmPasswordController,),
                  ],
                )),
                AppButton(label:LocaleKeys.update_password_button.tr(),tapped: () async {
                  if(key.currentState?.validate()??false){
                    await context.read<ProfileCubit>().resetPassword(currentPasswordController.text,
                        newPasswordController.text, confirmPasswordController.text);
                  }
                },),
              ],
            ),
          ),
        ),
      ),
    ),
);
  }
}
