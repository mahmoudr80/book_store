import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:book_store/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) => current is GetUserLoading ||
                current is  GetUserSuccess || current is  GetUserFailed,
  builder: (context, state) {
    if(state is GetUserSuccess){
      return Row(
        spacing: 13.w,
        children: [
          CircleAvatar(radius: 45.r,
            child:state.userModel.data.image!=null? ClipRRect(borderRadius: BorderRadiusGeometry.circular(100.r),child: Image.network(state.userModel.data.image!)):null,),
          Expanded(
            child: Column(
              children: [
                Text(state.userModel.data.name,style: AppTextStyle.labelStyle.copyWith(fontWeight: FontWeight.bold),),
                Text(state.userModel.data.email,style: AppTextStyle.hintStyle,),
              ],
            ),
          ),
          IconButton(onPressed: () {
            if(context.locale==Locale("en")){
              context.setLocale(Locale("ar"));
            }
            else{
              context.setLocale(Locale("en"));
            }
          }, icon:Icon(Icons.language_outlined))
        ],
      );
    }
    else if(state is GetUserLoading){
      return Shimmer.fromColors(baseColor: AppColor.primaryColor,
          highlightColor:Colors.white, child:
      Row(
        spacing: 13.w,
        children: [
          CircleAvatar(radius: 45.r,
          ),
          Column(
            children: [
              Text(LocaleKeys.user_label.tr(),style: AppTextStyle.labelStyle.copyWith(fontWeight: FontWeight.bold),),
              Text(LocaleKeys.auth_email.tr(),style: AppTextStyle.hintStyle,),
            ],
          )
        ],
      ));
    }
    else{
      return
          Row(
            spacing: 13.w,
            children: [
              CircleAvatar(radius: 45.r,
              ),
              Column(
                children: [
                  Text(LocaleKeys.anonymous.tr(),style: AppTextStyle.labelStyle.copyWith(fontWeight: FontWeight.bold),),
                  Text(LocaleKeys.anonymous_email.tr(),style: AppTextStyle.hintStyle,),
                ],
              )
            ],
          );
    }

  },
)],
      ),
    );
  }
}
