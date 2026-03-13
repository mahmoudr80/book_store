import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/gen/assets.gen.dart';
import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, this.controller, required this.hintText,
    this.secured=false,  this.keyboardType=TextInputType.emailAddress,
    this.validators, this.maxLength, this.focusNode, this.onChanged});
final TextEditingController ?controller;
final String hintText;
final bool secured;
final  TextInputType keyboardType;
final  String? Function(String?)? validators;
final int?maxLength;
final FocusNode?focusNode;
final void Function(String)? onChanged;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool visible = true;
  void toggle(){
        
      setState(() {
        visible=!visible;
      });
    
  }
// todo i will implement style for app titles
  @override
  Widget build(BuildContext context) {

    BorderRadius radius=BorderRadius.circular(8.r);
    OutlineInputBorder border= OutlineInputBorder(borderRadius:radius ,borderSide: BorderSide(color: AppColor.borderColor));
    OutlineInputBorder focusBorder= OutlineInputBorder(borderRadius:radius ,borderSide: BorderSide(color: AppColor.primaryColor));
    OutlineInputBorder errorBorder= OutlineInputBorder(borderRadius:radius ,borderSide: BorderSide(color: Colors.redAccent));
    return TextFormField(
      onChanged:widget.onChanged ,
      maxLength: widget.maxLength,
      focusNode:widget.focusNode ,
      validator:widget.validators ,
      keyboardType:widget.keyboardType ,
      cursorColor: AppColor.primaryColor,
      cursorHeight: 20.h,
      cursorWidth: 2.w,
      controller: widget.controller,
    onTapOutside: (event) => FocusScope.of(context).unfocus(),
      obscureText: widget.secured&&visible,
    decoration: InputDecoration(
      counterText: "",
      suffixIcon:widget.secured?
      visible? Padding(
        padding:  EdgeInsets.all(16.r),
        child: InkWell(
            onTap:toggle,
            child: SvgPicture.asset(Assets.images.visibilityIcon)),
      )
          : IconButton(onPressed: toggle,icon: Icon(Icons.visibility_off))
          :null,
     // Icon(Icons.visibility,color: AppColor.primaryTextFormIconColor,)

      hintText: widget.hintText,
      hintStyle: AppTextStyle.hintStyle,
      fillColor:AppColor.primaryTextFormColor,
      filled: true,
      errorStyle:AppTextStyle.errorStyle,
      enabledBorder: border,
      focusedBorder: focusBorder,
      errorBorder: errorBorder,
      focusedErrorBorder:focusBorder
    ),
    );
  }
}