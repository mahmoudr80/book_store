import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/utils/app_snackBar.dart';
import 'package:book_store/core/widgets/custom_network_img.dart';
import 'package:book_store/feature/home/data/models/product_model.dart';
import 'package:book_store/feature/wish_list/data/model/wish_list_product.dart';
import 'package:book_store/feature/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';

class WishlistProductItem extends StatelessWidget {
  const WishlistProductItem({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.r),
      decoration: BoxDecoration(
        color: AppColor.productBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImg(url: product.image,height: 180,width: 300,),
          Text(product.name,style: AppTextStyle.labelStyle,textAlign: TextAlign.center,
          overflow:TextOverflow.ellipsis ,maxLines: 2,),
         Spacer(),
          Row(
            children: [
              Expanded(child: Text(product.price,style: AppTextStyle.buttonTextStyle,)),
            IconButton(onPressed: () async {
              await context.read<WishListCubit>().removeFromWishlist(product.id);
            }, icon: SvgPicture.asset(Assets.icons.cancelIcon))
            ],
          ),
        ],
      ),
    );
  }
}
