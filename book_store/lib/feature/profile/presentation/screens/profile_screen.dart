import 'package:book_store/core/dependency_injection/service_locator.dart';
import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/feature/profile/data/repository/profile_repository.dart';
import 'package:book_store/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:book_store/feature/profile/presentation/widgets/custom_app_bar.dart';
import 'package:book_store/feature/profile/presentation/widgets/custom_list_tile.dart';
import 'package:book_store/feature/profile/presentation/widgets/user_widget.dart';
import 'package:book_store/gen/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ProfileCubit(getIt<ProfileRepository>())..getUser(),
  child: Column(
      children: [
      CustomAppBar(),
        Spacer(flex: 1,),
       UserWidget(),
        Spacer(flex: 2,),

       Column(
         spacing: 10.h,
         children: [
           CustomListTile(title: LocaleKeys.my_orders.tr(),tapped: () => Navigator.pushNamed(context, RoutesScreens.myOrderScreen) ,),
           CustomListTile(title: LocaleKeys.edit_profile.tr(),tapped: () => Navigator.pushNamed(context, RoutesScreens.updateProfileScreen),),
           CustomListTile(title: LocaleKeys.reset_password_profile.tr(),
           tapped: () => Navigator.pushNamed(context, RoutesScreens.updatePasswordScreen),),
           CustomListTile(title: LocaleKeys.faq.tr(),),
           CustomListTile(title: LocaleKeys.contact_us.tr(),),
           CustomListTile(title: LocaleKeys.privacy_terms.tr(),),



         ],
       ),
       Spacer(flex: 8,),

      ],
    ),
);
  }
}
