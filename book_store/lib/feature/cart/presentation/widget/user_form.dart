import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/validators/auth_validation.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/feature/cart/domain/Entity/governorate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserForm extends StatelessWidget {
  const UserForm({super.key,  this.nameController,
    this.emailController, this.addressController,
    this.phoneController, this.governorateController, this.formKey});
final TextEditingController ?nameController;
final TextEditingController ?emailController;
final TextEditingController ?addressController;
final TextEditingController ?phoneController;
final TextEditingController ?governorateController;
  final GlobalKey<FormState>?formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: Column(
      spacing: 12.h,
      children: [
      CustomTextFormField(hintText: "Full Name",
        controller: nameController,validators: Validators.validateUsername,),
      CustomTextFormField(hintText: "Email",
          controller: emailController,validators: Validators.validateEmail,),
      CustomTextFormField(hintText: "Address",
          controller: addressController,validators: Validators.validateAddress,),
      CustomTextFormField(hintText: "Phone",
          controller: phoneController,validators: Validators.validateEgyptPhone),
      CustomTextFormField(hintText: "Governorate",
        controller: governorateController,
          validators: Validators.validateGovernorate
      ,readOnly: true,suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,
          size: 25.r,color: AppColor.greyColor),tapped: () async {
         int gov=await governorateDialog(context);
         governorateController?.text=governorates[gov];
        },
      ),
    ],));
  }
}
