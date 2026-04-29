import 'package:book_store/core/dependency_injection/service_locator.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/feature/home/data/models/product_model.dart';
import 'package:book_store/feature/wish_list/data/repositories/wish_list_repository.dart';
import 'package:book_store/feature/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:book_store/feature/wish_list/presentation/widgets/product_item.dart';
import 'package:book_store/feature/wish_list/presentation/widgets/wish_list.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/wish_list_product.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) => WishListCubit(getIt<WishListRepository>())..getWishList(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(LocaleKeys.wishlist.tr(),style: AppTextStyle.headlineStyle,),
          WishList(),
        ],
      ),);
  }
}
