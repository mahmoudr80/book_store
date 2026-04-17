import 'package:book_store/core/widgets/custom_back_button.dart';
import 'package:book_store/feature/home/presentaion/cubit/home_cubit.dart';
import 'package:book_store/feature/home/presentaion/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/search_books_list.dart';
//todo update search API
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
          child: Column(
            spacing: 20.h,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchWidget(
                hintText: "Search Store",
                onSearch: (name) =>
                    context.read<HomeCubit>().searchOnBook(name),
              ),
              SearchBooksList(),
            ],
          ),
        ),
      ),
    );
  }
}
