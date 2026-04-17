import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/feature/cart/data/models/cart_model.dart';
import 'package:book_store/feature/home/data/models/product_model.dart';
import 'package:book_store/feature/wish_list/data/model/wish_list_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key, required this.cartItem});
final CartItem cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 118.h,
          width: 100.w,
          child:
          Image.network(
             cartItem.item_product_image
          ,fit: BoxFit.fill,),
        ),
        Spacer(flex: 1,),
        Column(
          spacing: 9.h,
          children: [
            Text(cartItem.item_product_name,style: AppTextStyle.labelStyle.copyWith(color: AppColor.cartTextColor,
            fontSize: 18.sp),),
            Text(cartItem.item_product_price,style: AppTextStyle.labelStyle.copyWith(fontSize: 16.sp),),
SizedBox(height: 15.h,),
            Row(
              spacing: 15.w,
              children: [
    Container(
    width: 24.w,height: 24.h,
    decoration:  BoxDecoration(color: AppColor.addRemoveIconColor.withAlpha(90)
    ,borderRadius: BorderRadiusGeometry.circular(6.r)),
    child: Icon(Icons.add)

    ),
                Text(cartItem.item_product_stock.toString(),style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
                Container(
                  width: 24.w,height: 24.h,
    decoration:  BoxDecoration(color: AppColor.addRemoveIconColor.withAlpha(90)
      ,borderRadius: BorderRadiusGeometry.circular(6.r)),
                  child: Icon(Icons.remove)

                ),
              ],
            )
          ],
        ),
        Spacer(flex: 4,),
        IconButton(onPressed: () {

        }, icon:SvgPicture.asset(Assets.icons.cancelIcon,width: 24.w,
            height: 24.h,))
      ],
    );
  }
}
