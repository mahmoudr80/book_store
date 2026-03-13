import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/feature/auth/presentation/widgets/custom_sign_in_button.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Expanded(child: Divider(color:AppColor.borderColor,)),
          Expanded(child: Text("OR",textAlign: TextAlign.center,style: TextStyle(color: AppColor.primaryTextFormIconColor),)),
          Expanded(child: Divider(color:AppColor.borderColor,))],),
        SizedBox(height: 21.h,),
        CustomSignInButton(image: Assets.images.googleIcon.image(), title: LocaleKeys.auth_sign_in_with_google.tr()),
        SizedBox(height: 15.h,),
        CustomSignInButton(image: Assets.images.appleIcon.image(), title: LocaleKeys.auth_sign_in_with_apple.tr()),
      ],
    );
  }
}
