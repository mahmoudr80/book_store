import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../gen/assets.gen.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(

      builder: (context, state) {
        final books = state.bestSellerBooks?.data ?? [];

        if (books.isEmpty) {
          return SliverToBoxAdapter(child:  CircularProgressIndicator());
        }
        if(state.status==EnHomeStatus.success){
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 260.h,
              child: ListView.separated(
                  scrollDirection:Axis.horizontal,
                  itemBuilder:
             (context, index) =>  ProductItem(
                 bookModel: state.bestSellerBooks!.data![index],
               buyTapped:() => Navigator.pushNamed(context,RoutesScreens.bookDetailScreen
               ,arguments: state.bestSellerBooks!.data![index] ) ,),
                  separatorBuilder: (context, index) => SizedBox(width: 10.w,),
                  itemCount: state.bestSellerBooks!.data!.length),
            ),
          );

        }
        else if (state.status==EnHomeStatus.loading){
          return
            SliverToBoxAdapter(
              child: SizedBox(
                height: 235.h,
                child: ListView.separated(
                    scrollDirection:Axis.horizontal,itemBuilder:
                    (context, index) =>
                        Shimmer.fromColors(
                            baseColor: AppColor.primaryColor.withAlpha(50),
                            highlightColor: Colors.white,
                            child:  Container(
                              width: 190.w,
                              padding: EdgeInsets.all(16.r),
                              decoration: BoxDecoration(color: AppColor.productBackgroundColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                            )),
                    separatorBuilder: (context, index) => SizedBox(width: 10.w,),
                    itemCount: 4),
              ),
            );

        }else{
          return SliverToBoxAdapter(child: Lottie.asset(Assets.animations.notFoundJson),);
        }
      },
    );
  }
}

