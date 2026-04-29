import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/custom_network_img.dart';
import 'package:book_store/feature/home/data/models/product_model.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.bookModel, this.buyTapped});
  final BookModel bookModel;
  final void Function()? buyTapped;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215.w,
      //height: 220.h,
      padding: EdgeInsets.all(3.r),
      decoration: BoxDecoration(
        color: AppColor.productBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImg(url: bookModel.image,height: 180,width: 300,),
          Text(bookModel.name,style: AppTextStyle.labelStyle,textAlign: TextAlign.center,
          overflow:TextOverflow.ellipsis ,maxLines: 2,),
          Spacer(),
          Row(
           // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(bookModel.price,style: AppTextStyle.buttonTextStyle,)),
              InkWell(onTap:buyTapped ,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 23.w,vertical: 3.h),
                  decoration: BoxDecoration(color: AppColor.buttonColor,borderRadius: BorderRadiusGeometry.circular(8.r)),
                  child: Text(LocaleKeys.buy.tr(),style: AppTextStyle.buttonTextStyle.copyWith(color: Colors.white),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
