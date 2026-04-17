import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_widget.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(child:
    ListView.separated(itemBuilder: (context, index) => OrderWidget(),
        separatorBuilder:(context, index) =>  SizedBox(height: 10.h,child: Divider(),),
        itemCount: 10));
  }
}

