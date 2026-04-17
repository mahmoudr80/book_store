import 'package:book_store/feature/cart/presentation/widget/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/cart_cubit.dart';

class CartProductList extends StatelessWidget {
  const CartProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {

            if(state is CartSuccess){
              if( state.cartModel.data.cart_items.isNotEmpty){
                return ListView.separated(itemBuilder: (context, index) =>
                    CartWidget(cartItem: state.cartModel.data.cart_items[index]),
                    padding:  EdgeInsets.only(left: 20.0.w,right: 23.w,top: 50.h,bottom: 15.h),
                    separatorBuilder: (context, index) => SizedBox(height:30.h,child: Divider()),
                    itemCount: state.cartModel.data.cart_items.length);
              }
              else{
                return Lottie.asset(Assets.animations.notFoundJson);
              }

            }
            else if(state is CartLoading){
              return Shimmer.fromColors(
                  baseColor: AppColor.primaryColor.withAlpha(50),
                highlightColor: Colors.white,
                  child:   ListView.separated(itemBuilder: (context, index) =>Container(
                    decoration: BoxDecoration(color: AppColor.productBackgroundColor,
                        borderRadius: BorderRadius.circular(10.r)),
                    height: 150.h,
                    width: double.infinity,
                  ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: 5),);
            }
            else{
              return Lottie.asset(Assets.animations.notFoundJson);
            }

          },
        ));
  }
}
