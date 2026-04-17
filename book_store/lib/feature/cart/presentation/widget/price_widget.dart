import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../cubit/cart_cubit.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Text("Total:",style:AppTextStyle.labelStyle.copyWith(color: AppColor.cartTextColor)),
          BlocBuilder<CartCubit, CartState>(builder: (context, state) {
            if(state is CartSuccess){
              return Text(
                "\$ ${state.cartModel.data.total}",style: AppTextStyle.labelStyle,);
            }
            else if(state is CartLoading){
              return Shimmer.fromColors(
                  baseColor: AppColor.primaryColor, highlightColor: Colors.white,
                  child: Text("0",style: AppTextStyle.labelStyle,));
            }else{
              return Text("0",style: AppTextStyle.labelStyle);
            }
          },)
        ]
    );
  }
}
