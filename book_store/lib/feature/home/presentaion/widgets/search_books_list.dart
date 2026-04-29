import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/widgets/product_item.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class SearchBooksList extends StatelessWidget {
  const SearchBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if(state.status==EnHomeStatus.success){
          return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ProductItem(bookModel: state.allBooks!.data![index],
                  buyTapped:() {
                    Navigator.pushNamed(context, RoutesScreens.bookDetailScreen,arguments:state.allBooks!.data![index] );
                  } ,),childCount:  state.allBooks!.data?.length??0,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.59,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 10.h
              ));
          //
          //   GridView.builder(
          //   padding: EdgeInsets.all(10.r), itemCount: state.allBooks!.data?.length??0, gridDelegate:
          // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          //     childAspectRatio: 0.60,
          //     crossAxisSpacing: 15.w,
          //     mainAxisSpacing: 10.h),
          //   itemBuilder: (context, index) => ProductItem(bookModel: state.allBooks!.data![index],
          //     buyTapped:() {
          //       Navigator.pushNamed(context, RoutesScreens.bookDetailScreen,arguments:state.allBooks!.data![index] );
          //     } ,),);
        }
        else if (state.status==EnHomeStatus.loading){
          return
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          Shimmer.fromColors(
                            baseColor: AppColor.primaryColor.withAlpha(50),
                            highlightColor: Colors.white,
                            child:
                            Container(
                              padding: EdgeInsets.all(16.r),
                              decoration: BoxDecoration(color: AppColor.productBackgroundColor,
                                  borderRadius: BorderRadius.circular(10.r))))
                           ,childCount:  4,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.60,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 10.h
                ));

          //   Column(
          //   children: [
          //     Expanded(
          //       child: Shimmer.fromColors(
          //         baseColor: AppColor.primaryColor.withAlpha(50),
          //         highlightColor: Colors.white,
          //         child:  GridView.builder(
          //           padding: EdgeInsets.all(10.r), itemCount: 10, gridDelegate:
          //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          //             childAspectRatio: 0.7,
          //             crossAxisSpacing: 15.w,
          //             mainAxisSpacing: 10.h),
          //           itemBuilder: (context, index) => Container(
          //             padding: EdgeInsets.all(16.r),
          //             decoration: BoxDecoration(color: AppColor.productBackgroundColor,
          //                 borderRadius: BorderRadius.circular(10.r)),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // );
        }
        else{
        return SliverToBoxAdapter(child:Lottie.asset(Assets.animations.notFoundJson) ,) ;
        }
      },
    );
  }
}
