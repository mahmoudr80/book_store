import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final UserModel user;
  const HomeScreen({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Text("name : ${user.name} , email : ${user.email}",style: AppTextStyle.headlineStyle,),
          )
        ],
      ),
    );
  }
}
