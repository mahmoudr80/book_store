
import 'package:book_store/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyle {
  ///style for hint text in app
  static  TextStyle hintStyle=TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400,color: AppColor.greyColor);
  static  TextStyle errorStyle=TextStyle(fontSize: 9.sp,
      fontWeight: FontWeight.bold,color: Colors.redAccent);
  static  TextStyle headlineStyle=TextStyle(fontSize: 30.sp,color: Color(0xff2F2F2F));

}