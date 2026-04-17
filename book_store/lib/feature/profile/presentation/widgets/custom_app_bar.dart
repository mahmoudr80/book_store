import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text("Profile",style: AppTextStyle.headlineStyle,),
        Spacer(),
        IconButton( onPressed: () {
          
        }, icon:SvgPicture.asset(Assets.icons.exitIcon,width: 15.r,height: 15.r,))
      ],
    );
  }
}
