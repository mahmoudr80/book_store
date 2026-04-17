import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/app_button.dart';
import 'package:book_store/feature/cart/data/repository/home_repository.dart';
import 'package:book_store/feature/cart/domain/usecase/getCartProductsUseCase.dart';
import 'package:book_store/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:book_store/feature/cart/presentation/widget/cart_product_list.dart';
import 'package:book_store/feature/cart/presentation/widget/cart_widget.dart';
import 'package:book_store/feature/cart/presentation/widget/price_widget.dart';
import 'package:book_store/feature/home/data/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/dependency_injection/service_locator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("My Cart",style: AppTextStyle.headlineStyle,),
          CartProductList(),
          Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w,vertical: 15.h),
          child: Column(
            spacing: 19.h,
            children: [
              PriceWidget(),
              AppButton(label: "Checkout",tapped: () {
                    Navigator.pushNamed(context,RoutesScreens.placeOrderScreen);
              },)
            ],
          ),)
       
        ],
      );
  }
}
