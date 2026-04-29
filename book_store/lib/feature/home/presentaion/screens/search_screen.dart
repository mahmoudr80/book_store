import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:book_store/core/utils/app_snackBar.dart';
import 'package:book_store/core/widgets/custom_back_button.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/search_books_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(tapped: () => Navigator.pop(context)),
        leadingWidth: 62.w,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 25.h),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child:
                BlocListener<HomeCubit, HomeState>(
                  listenWhen: (previous, current) => current.action==EnHomeAction.searchOnProduct
                      &&(current.status==EnHomeStatus.loading||
                          current.status==EnHomeStatus.success||
                          current.status==EnHomeStatus.failed),
                  listener: (context, state) {
                    if(state.status==EnHomeStatus.success){
                      AppSnackbar.showSuccess(context,LocaleKeys.books_found.tr());
                    }
                  },
                  child: SearchWidget(
                    hintText: LocaleKeys.search_store_hint.tr(),
                    onSearch: (name) =>
                        context.read<HomeCubit>().searchOnBook(name),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20.h,),),
              SearchBooksList()
              ],
            ),
          ),
        ),
      );
  }
}
