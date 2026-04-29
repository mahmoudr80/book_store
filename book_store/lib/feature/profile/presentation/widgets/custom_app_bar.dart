import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routes/routes_screens.dart';
import '../cubit/profile_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.logoutTapped});
final void Function()?logoutTapped;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text(LocaleKeys.profile.tr(),style: AppTextStyle.headlineStyle,),
        Spacer(),
    BlocListener<ProfileCubit,ProfileState>(
    listenWhen:(previous, current) =>  current is LogoutSuccess,
    listener: (context, state) {
    if(state is LogoutSuccess){
    Navigator.pushNamedAndRemoveUntil(context,RoutesScreens.welcomeScreen,(route) => false,);
    }
    },
    child:
        IconButton( onPressed: () async {
          await context.read<ProfileCubit>().logout();
        }, icon:SvgPicture.asset(Assets.icons.exitIcon,width: 15.r,height: 15.r,))
    )],
    );
  }
}
