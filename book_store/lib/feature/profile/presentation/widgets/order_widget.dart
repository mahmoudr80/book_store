import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${LocaleKeys.order_no.tr()} 23123420",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
        Text("20/03/2026",style: AppTextStyle.hintStyle,),
      ],
    );
  }
}
