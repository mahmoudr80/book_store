import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.title, this.tapped});
final String title;
final  void Function()? tapped;
  @override
  Widget build(BuildContext context) {
    return    Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(
              color:  Color(0xff8A959E).withAlpha(50),
              blurRadius: 4,
              blurStyle: BlurStyle.outer
          )]
      ),
      child: ListTile(
        onTap: tapped,
        leading: Text(title,style: AppTextStyle.labelStyle.copyWith(color: AppColor.greyColor),),
        trailing: Icon(Icons.arrow_forward_ios),

      ),
    );
  }
}
