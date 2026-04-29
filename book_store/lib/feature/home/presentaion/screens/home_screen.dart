import 'package:book_store/core/dependency_injection/service_locator.dart';
import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/feature/home/data/repository/home_repository.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/widgets/best_seller_list.dart';
import 'package:book_store/feature/home/presentaion/widgets/home_app_bar.dart';
import 'package:book_store/feature/home/presentaion/widgets/product_list.dart';
import 'package:book_store/feature/home/presentaion/widgets/slider.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/best_seller_list.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   CustomScrollView(
        slivers:[
     SliverToBoxAdapter(
       child:   Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           HomeAppBar(),
           IconButton(onPressed:() =>
               Navigator.pushNamed(context,RoutesScreens.searchScreen),icon: Icon(Icons.search,size: 24.r,)),

         ],),
     ),
      SliverToBoxAdapter(
        child: SizedBox(height: 25.h,),
      ),
        SliverToBoxAdapter(
        child:SliderWidget(),
        ),
          SliverToBoxAdapter(
            child:  SizedBox(height: 15.h,),
          ),
          SliverToBoxAdapter(
            child:    Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Text(LocaleKeys.best_seller.tr(),style: AppTextStyle.headlineStyle,),
            ),
          )
,
      SliverToBoxAdapter(
        child:      SizedBox(height: 15.h,),
      )     ,
          BestSellerList() ,
     SliverToBoxAdapter(
       child: SizedBox(height: 15.h,),
     ),
     SliverToBoxAdapter(
       child:Padding(
         padding:  EdgeInsets.only(left: 10.w),
         child: Text(LocaleKeys.all_books.tr(),style: AppTextStyle.headlineStyle,),
       ) ,
     ),
          ProductList()
          ]

        );
  }
}
