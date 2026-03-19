import 'package:book_store/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppButton extends StatelessWidget {
  const AppButton({super.key, this.backColor, required this.label, this.tapped});
  ///background button color
  final Color ?backColor;
  ///label of button
final String label;
  ///call back function on tapped on button
final void Function()?tapped;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: backColor??AppColor.primaryColor,
      borderRadius: BorderRadius.circular(8.r),
      child: InkWell(
        onTap: tapped,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 19.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(  borderRadius: BorderRadius.circular(8.r),
             border: backColor==null?null:Border.all(color: Colors.black,width: 1.w)),
          child: Text(label,style: TextStyle(fontSize: 15.sp,color: backColor==null?Colors.white:Colors.black),),
        ),
      ),
    );
  }
}
