import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../widgets/orders_list.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: CustomBackButton(tapped: () => Navigator.pop(context)),
        ),
        leadingWidth: 70.w,
        title: Text("My Orders",style: AppTextStyle.headlineStyle,),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
              padding:  EdgeInsets.all(20.r),
              child: Column(
                children: [
                  OrdersList(),
                  Row(
                    children: [
                      Spacer(),
                      Text("Total Amount:",style: AppTextStyle.hintStyle,),
                      Text("\$150",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  )

                ],
              ))),
    );
  }
}
