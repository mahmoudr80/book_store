import 'package:book_store/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignInButton extends StatelessWidget {
  const CustomSignInButton({super.key, required this.image, required this.title});
final Image image ;
final String title ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(color: AppColor.primaryTextFormBorderColor)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [image,SizedBox(width:4.w ,),Text(title)],),
    );
  }
}
