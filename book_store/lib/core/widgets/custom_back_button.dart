import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.tapped});
  final void Function()?tapped;
  @override
  Widget build(BuildContext context) {
    return  Container(alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      width:41.r,height:41.r,decoration :BoxDecoration(color: Colors.white
        ,borderRadius: BorderRadius.circular(12.r),border: Border.all(color: AppColor.borderColor)),
      child: IconButton(onPressed:tapped , icon:Icon(Icons.arrow_back_ios,color: Colors.black,)),);
  }
}
