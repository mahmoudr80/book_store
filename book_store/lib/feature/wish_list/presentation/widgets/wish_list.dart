import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/feature/wish_list/presentation/widgets/product_item.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../cubit/wish_list_cubit.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<WishListCubit, WishListState>(
        builder: (context, state) {
          if(state is WishListSuccess){
            return GridView.builder(
              padding: EdgeInsets.all(10.r), itemCount: state.wishListProduct.data.length
              , gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                childAspectRatio: 0.67,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 10.h),
              itemBuilder: (context, index) => WishlistProductItem(product: state.wishListProduct.data[index]),);
          }
          else if (state is WishListLoading){
            return Shimmer.fromColors(
              baseColor: AppColor.primaryColor.withAlpha(50),
              highlightColor: Colors.white,
              child:  GridView.builder(
              padding: EdgeInsets.all(10.r), itemCount: 10, gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 10.h),
              itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(color: AppColor.productBackgroundColor,
                      borderRadius: BorderRadius.circular(10.r)),
              ),
                    ),
                        );
          }else{
            return Lottie.asset(Assets.animations.notFoundJson);
          }

        },
      ),
    );
  }
}
