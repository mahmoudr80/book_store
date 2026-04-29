import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/widgets/product_item.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(

      builder: (context, state) {
        final books = state.allBooks?.data ?? [];

        if (books.isEmpty) {
          return SliverToBoxAdapter(child: CircularProgressIndicator());
        }
        if(state.status==EnHomeStatus.success ){
          return
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  childAspectRatio: 0.66,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 10.h ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => ProductItem(bookModel: state.allBooks!.data![index],
                  buyTapped:() {
                    Navigator.pushNamed(context, RoutesScreens.bookDetailScreen,arguments:state.bestSellerBooks!.data![index] );
                  } ,),
                  childCount: state.allBooks!.data?.length??0
              ),
            );

        }
        else if (state.status==EnHomeStatus.loading){
          return
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  childAspectRatio: 0.67,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 10.h ),
              delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          Shimmer.fromColors(
                              baseColor: AppColor.primaryColor.withAlpha(50),
                              highlightColor: Colors.white,
                              child: Container(
                            padding: EdgeInsets.all(16.r),
                            decoration: BoxDecoration(color: AppColor.productBackgroundColor,
                                borderRadius: BorderRadius.circular(10.r)),
                          )),
                  childCount: 4

              ),
            );

        }else{
          return SliverToBoxAdapter(child:
          SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset(Assets.animations.notFoundJson)),)
          ;
        }

      },
    );
  }
}
