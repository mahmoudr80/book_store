import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:book_store/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/widgets/custom_back_button.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  GlobalKey<FormState> key=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController addressController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: CustomBackButton(tapped: () => Navigator.pop(context)),
        ),
        leadingWidth: 70.w,
        title: Text(LocaleKeys.edit_profile.tr(), style: AppTextStyle.headlineStyle,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) => current is GetUserSuccess||
                current is GetUserFailed||current is GetUserLoading,
            builder: (context, state) {
              if(state is GetUserSuccess){
                nameController;
                addressController;
                phoneController;
                nameController.text=state.userModel.data.name;
                addressController.text=state.userModel.data.address??"";
                phoneController.text=state.userModel.data.phone??"";
                return SingleChildScrollView(
                  child: Column(
                    spacing: 30.h,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                  
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 70.r,
                            child: ClipRRect(borderRadius: BorderRadiusGeometry.circular(100.r),
                            child: state.userModel.data.image!=null?Image.network( state.userModel.data.image!)
                              :null,),
                          ),
                          Positioned(
                              right: 10,
                              bottom: 10,
                              child: Container(
                                  padding: EdgeInsets.all(6.r),
                                  decoration: BoxDecoration(color: Colors.white,
                                      borderRadius: BorderRadiusGeometry.circular(
                                          100.r)),
                                  child: SvgPicture.asset(
                                      Assets.icons.cameraIcon))),
                        ],
                      ),
                      Form(
                          key: key,
                          child: Column(
                            spacing: 15.h,
                        children: [
                          CustomTextFormField(hintText: LocaleKeys.full_name_hint.tr(),controller: nameController,),
                          CustomTextFormField(hintText: LocaleKeys.phone_hint.tr(),controller: phoneController,),
                          CustomTextFormField(hintText: LocaleKeys.address_hint.tr(),controller: addressController,),
                  
                        ],
                      )),
                  
                      AppButton(label: LocaleKeys.update_profile_button.tr(),tapped: () async {
                        if(key.currentState?.validate()??false){
                          await context.read<ProfileCubit>().
                          updateProfile(nameController.text, phoneController.text, addressController.text);
                        }
                  
                                },)
                    ],
                  ),
                );
              }
              if(state is GetUserLoading){
                return Shimmer.fromColors(baseColor: AppColor.primaryColor,
                  highlightColor: Colors.white,
                  child: Column(
                  spacing: 12.h,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(flex: 1,),
                    Stack(
                      children: [

                        CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 70.r,
                        ),
                        Positioned(
                            right: 10,
                            bottom: 10,
                            child: Container(
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(color: Colors.white,
                                    borderRadius: BorderRadiusGeometry.circular(
                                        100.r)),
                                child: SvgPicture.asset(
                                    Assets.icons.cameraIcon))),
                      ],
                    ),
                    Spacer(flex: 1,),
                    CustomTextFormField(hintText: LocaleKeys.full_name_hint.tr()),
                    CustomTextFormField(hintText: LocaleKeys.phone_hint.tr()),
                    CustomTextFormField(hintText: LocaleKeys.address_hint.tr()),

                    Spacer(flex: 5,),
                    AppButton(label: LocaleKeys.update_profile_button.tr())
                  ],
                ));
              }
             else {
                return Column(
                  spacing: 12.h,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(flex: 1,),
                    Stack(
                      children: [

                        CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 70.r,
                        ),
                        Positioned(
                            right: 10,
                            bottom: 10,
                            child: Container(
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(color: Colors.white,
                                    borderRadius: BorderRadiusGeometry.circular(
                                        100.r)),
                                child: SvgPicture.asset(
                                    Assets.icons.cameraIcon))),
                      ],
                    ),
                    Spacer(flex: 1,),
                    CustomTextFormField(hintText: LocaleKeys.full_name_hint.tr()),
                    CustomTextFormField(hintText: LocaleKeys.phone_hint.tr()),
                    CustomTextFormField(hintText: LocaleKeys.address_hint.tr()),

                    Spacer(flex: 5,),
                    AppButton(label: LocaleKeys.update_profile_button.tr())
                  ],
                );
              }

            },
          ),
        ),
      ),
    );
  }
}
