import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is BestSellerFailed ||
          current is BestSellerLoading ||  current is BestSellerSuccess ,
      builder: (context, state) {
        if(state is BestSellerSuccess){
          return Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10.r), itemCount: state.bestSellerBooks.data?.length??0, gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 10.h),
              itemBuilder: (context, index) => ProductItem(bookModel: state.bestSellerBooks.data![index]),),
          );
        }
        else if (state is BestSellerLoading){
          return Expanded(
            child: Shimmer.fromColors(
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
                        ),
          );
        }else{
          showDialog(context: context, builder:(context) => Text("Error"),);
        }
      throw Exception("error");
      },
    );
  }
}
