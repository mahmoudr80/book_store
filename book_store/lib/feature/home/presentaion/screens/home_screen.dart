import 'package:book_store/core/dependency_injection/service_locator.dart';
import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/feature/home/data/repository/home_repository.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/widgets/best_seller_list.dart';
import 'package:book_store/feature/home/presentaion/widgets/home_app_bar.dart';
import 'package:book_store/feature/home/presentaion/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //Home appBar
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeAppBar(),
            IconButton(onPressed:() =>
                Navigator.pushNamed(context,RoutesScreens.searchScreen),icon: Icon(Icons.search,size: 24.r,)),

          ],),
        SizedBox(height: 25.h,),
        BlocProvider(
          create: (context) => HomeCubit(getIt<HomeRepository>())..getSliders(),
          child: SliderWidget(),
        ),
        SizedBox(height: 15.h,),
        Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: Text("Best Seller",style: AppTextStyle.headlineStyle,),
        ),

        BlocProvider(create: (context) => HomeCubit(getIt<HomeRepository>())..getBestSeller(),
          child:BestSellerList() ,)

      ],


    );
  }
}
