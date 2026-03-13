import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/core/widgets/customTextRich.dart';
import 'package:book_store/core/widgets/custom_back_button.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<TextEditingController>controllers=List.generate(6,(index) => TextEditingController(),);
    final List<FocusNode>focusNodes=List.generate(6,(index) => FocusNode(),);


    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(tapped: () => Navigator.pop(context),),
        leadingWidth: 60.w,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 22.h,vertical: 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.otp_verification.tr(),style: AppTextStyle.headlineStyle,),
              Spacer(flex: 1,),
              Text(LocaleKeys.message_verification.tr(),style: AppTextStyle.hintStyle,),
              Spacer(flex: 3,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  spacing: 7.w,
                  children:List.generate(6,(index) {
                    return Expanded(child: CustomTextFormField(hintText: "",
                    focusNode: focusNodes[index],maxLength: 1,controller: controllers[index],
                    keyboardType: TextInputType.number,onChanged: (value) {
                      if(value.isNotEmpty&&index<5){
                        FocusScope.of(context).requestFocus(focusNodes[index+1]);
                      }
                      else if(value.isEmpty && index>0){
                        FocusScope.of(context).requestFocus(focusNodes[index-1]);
                      }

                    },));
                  },),
                ),
              ),
              Spacer(flex: 3,),
              AppButton(label: LocaleKeys.verify_button.tr()),
              Spacer(flex: 36,),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Customtextrich(textButton: LocaleKeys.resend.tr(),textTitle:  LocaleKeys.no_code.tr(),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
