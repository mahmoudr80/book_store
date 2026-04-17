import 'package:book_store/core/dependency_injection/service_locator.dart';
import 'package:book_store/core/routes/routes_screens.dart';
import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/feature/profile/data/repository/profile_repository.dart';
import 'package:book_store/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:book_store/feature/profile/presentation/widgets/custom_app_bar.dart';
import 'package:book_store/feature/profile/presentation/widgets/custom_list_tile.dart';
import 'package:book_store/feature/profile/presentation/widgets/user_widget.dart';
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
           CustomListTile(title: "My Orders",tapped: () => Navigator.pushNamed(context, RoutesScreens.myOrderScreen) ,),
           CustomListTile(title: "Edit Profile",tapped: () => Navigator.pushNamed(context, RoutesScreens.updateProfileScreen),),
           CustomListTile(title: "Reset Password",
           tapped: () => Navigator.pushNamed(context, RoutesScreens.updatePasswordScreen),),
           CustomListTile(title: "FAQ",),
           CustomListTile(title: "Contact Us",),
           CustomListTile(title: "Privacy & Terms",),


         ],
       ),
       Spacer(flex: 8,),

      ],
    ),
);
  }
}
