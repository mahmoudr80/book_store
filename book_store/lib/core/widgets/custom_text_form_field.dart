import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.secured = false,
    this.keyboardType = TextInputType.emailAddress,
    this.validators,
    this.maxLength,
    this.focusNode,
    this.onChanged, this.hintStyle, this.prefixIcon, this.searchTapped, this.readOnly, this.suffixIcon, this.tapped,
  });

  /// controller is a TextEditingController
  final TextEditingController? controller;
  final String hintText;

  final void Function(String)? searchTapped;

  final TextStyle ?hintStyle;

  /// hide inputs in CustomTextFormField
  final bool secured;
final  void Function()? tapped;
  final Icon ?suffixIcon;

  final bool ?readOnly;

  final Widget ?prefixIcon;

  /// open a specific type of the keyboard (number,phone,text,etc...)
  final TextInputType keyboardType;

  /// check validators for this CustomTextFormField
  final String? Function(String?)? validators;

  /// maximum length of inputs in CustomTextFormField
  final int? maxLength;
  final FocusNode? focusNode;

  /// while changing inputs in CustomTextFormField this function fired
  final void Function(String)? onChanged;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obSecure = true;
  void toggle() {
    setState(() {
      obSecure = !obSecure;
    });
  }

  // todo I will implement AppColor and AppTextStyle
  @override
  Widget build(BuildContext context) {
    BorderRadius radius = BorderRadius.circular(8.r);
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: AppColor.borderColor),
    );
    OutlineInputBorder focusBorder = OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: AppColor.primaryColor),
    );
    OutlineInputBorder errorBorder = OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: Colors.redAccent),
    );
    return TextFormField(
      onTap: widget.tapped,
      readOnly: widget.readOnly??false,
      onFieldSubmitted: widget.searchTapped,
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      focusNode: widget.focusNode,
      validator: widget.validators,
      keyboardType: widget.keyboardType,
      cursorColor: AppColor.primaryColor,
      cursorHeight: 20.h,
      cursorWidth: 2.w,
      controller: widget.controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      obscureText: widget.secured && obSecure,
      decoration: InputDecoration(
        counterText: "",
        suffixIcon:
        widget.secured
            ? Padding(
                padding: EdgeInsets.all(16.r),
                child: InkWell(
                  onTap: toggle,
                  child: obSecure
                      ? SvgPicture.asset(Assets.images.visibilityIcon,width: 15.w,)
                      : Icon(Icons.visibility_off,size: 15.r,),
                ),
              )
            : widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle:widget.hintStyle?? AppTextStyle.hintStyle,
        fillColor: AppColor.primaryTextFormColor,
        filled: true,
        errorStyle: AppTextStyle.errorStyle,
        enabledBorder: border,
        focusedBorder: focusBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusBorder,
        prefixIcon: widget.prefixIcon
      ),
    );
  }
}
