import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/custom_back_button.dart';
import 'package:book_store/feature/home/data/models/product_model.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading:CustomBackButton(tapped: () => Navigator.pop(context),),
          leadingWidth: 60.w,
          actions: [
            IconButton(icon:
            SvgPicture.asset(Assets.icons.bookmark,width: 18.w,),onPressed: () {

            },)
          ],
        ),
      body: Padding(
        padding:  EdgeInsets.only(top: 40.h,bottom: 20.h,right: 22.w,left: 24.w),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Image.network(bookModel.image,fit: BoxFit.fill,)),
            Text(bookModel.name,style: AppTextStyle.headlineStyle,),
            Text(bookModel.category,style: TextStyle(color: AppColor.primaryColor),),
            Text(bookModel.description
            ,overflow: TextOverflow.ellipsis,maxLines: 10,textAlign: TextAlign.start,),
           Spacer(),
            Row(
              children: [
                Text(bookModel.price,style: AppTextStyle.labelStyle,),
                Spacer(),
                Container(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 35.w,vertical: 14.h),
                  decoration: BoxDecoration(color: AppColor.buttonColor,borderRadius: BorderRadiusGeometry.circular(8.r)),
                  child: Text("Add To Cart",style: AppTextStyle.labelStyle.copyWith(color: Colors.white),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
