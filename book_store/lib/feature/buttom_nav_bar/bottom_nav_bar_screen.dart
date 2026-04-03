import 'package:book_store/core/helper/app_constants.dart';
import 'package:book_store/core/theme/app_color.dart';
import 'package:book_store/feature/book_mark/book_mark_screen.dart';
import 'package:book_store/feature/cart/cart_screen.dart';
import 'package:book_store/feature/home/presentaion/home_screen.dart';
import 'package:book_store/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';
const List<Widget>screens = [HomeScreen(),BookMarkScreen(),CartScreen(),ProfileScreen()];
class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar:BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex =value;
            });
          },
          currentIndex: currentIndex,
          items: [
        BottomNavigationBarItem(icon: SvgPicture.asset(Assets.icons.home,
          colorFilter:ColorFilter.mode(currentIndex==0?AppColor.primaryColor:Colors.black, BlendMode.srcIn)  ,),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset(Assets.icons.bookmark,
          colorFilter:ColorFilter.mode(currentIndex==1?AppColor.primaryColor:Colors.black, BlendMode.srcIn)  ,),label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset(Assets.icons.group,
          colorFilter:ColorFilter.mode(currentIndex==2?AppColor.primaryColor:Colors.black, BlendMode.srcIn)  ,),label: '') ,
            BottomNavigationBarItem(icon: SvgPicture.asset(Assets.icons.profile,
          colorFilter:ColorFilter.mode(currentIndex==3?AppColor.primaryColor:Colors.black, BlendMode.srcIn)  ,),label: '')
      ]),
    
    );
  }
}

