import 'package:book_store/core/theme/app_color.dart';
import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.controller, required this.hintText,  this.secured=false});
final TextEditingController ?controller;
final String hintText;
final bool secured;
  @override
  Widget build(BuildContext context) {
    BorderSide border= BorderSide(color: AppColor.primaryTextFormBorderColor);
    return TextFormField(
      controller: controller,
    onTapOutside: (event) => FocusScope.of(context).unfocus(),obscureText: secured,
    decoration: InputDecoration(
      suffixIcon:secured?Icon(Icons.visibility,color: AppColor.primaryTextFormIconColor,):null,
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColor.primaryTextFormHintColor),
      fillColor:AppColor.primaryTextFormColor,
      filled: true,
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r),borderSide:border),
      focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(8.r),borderSide: BorderSide(color: Colors.deepPurple)),
      errorBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(8.r),borderSide:border),
    ),
    );
  }
}
