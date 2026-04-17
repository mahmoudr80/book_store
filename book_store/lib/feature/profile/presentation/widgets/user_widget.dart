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
  builder: (context, state) {
    if(state is GetUserSuccess){
      return Row(
        spacing: 13.w,
        children: [
          CircleAvatar(radius: 45.r,
            child:state.userModel.data.image!=null? ClipRRect(borderRadius: BorderRadiusGeometry.circular(100.r),child: Image.network(state.userModel.data.image!)):null,),
          Column(
            children: [
              Text(state.userModel.data.name,style: AppTextStyle.labelStyle.copyWith(fontWeight: FontWeight.bold),),
              Text(state.userModel.data.email,style: AppTextStyle.hintStyle,),
            ],
          )
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
              Text("User",style: AppTextStyle.labelStyle.copyWith(fontWeight: FontWeight.bold),),
              Text("email",style: AppTextStyle.hintStyle,),
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
                  Text("Anonymous",style: AppTextStyle.labelStyle.copyWith(fontWeight: FontWeight.bold),),
                  Text("anonymous@gmail.com",style: AppTextStyle.hintStyle,),
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
