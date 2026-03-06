import 'dart:ui';

import 'package:book_store/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.tapped, required this.title, this.color});
final void Function()?tapped;
final String title;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextButton(clipBehavior: Clip.none,onPressed: tapped, child: Text(title,style: Theme.of(context).textTheme.labelMedium?.copyWith(color: color??AppColor.primaryColor),));
  }
}
