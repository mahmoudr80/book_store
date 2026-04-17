
import 'package:book_store/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyle {
  ///style for hint text in app
  static  TextStyle hintStyle=TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400,color: AppColor.greyColor);
  static  TextStyle hintSearchStyle=TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,
      color: AppColor.hintTextColor);
  static  TextStyle errorStyle=TextStyle(fontSize: 9.sp,
      fontWeight: FontWeight.bold,color: Colors.redAccent);
  static  TextStyle headlineStyle=TextStyle(fontSize: 30.sp,color:AppColor.buttonColor);
  static  TextStyle buttonTextStyle=TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500);
  static  TextStyle labelStyle=TextStyle(fontSize: 18.sp,color: AppColor.buttonColor);

}