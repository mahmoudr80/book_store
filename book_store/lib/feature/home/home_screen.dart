import 'package:book_store/core/dependency_injection/service_locator.dart';
import 'package:book_store/core/session/session_manager.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String?token;

@override
  void initState() {
    super.initState();
      getToken();
  }
  Future<void>getToken() async {
    final manager = getIt<SessionManager>();
     token=await manager.getToken();
     setState(() {

     });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Text("name : ${widget.user.name} , email : ${widget.user.email}",style: AppTextStyle.headlineStyle,),
          ),

          Card(
            child: Text("token : $token ",style: AppTextStyle.headlineStyle,),
          )
        ],
      ),
    );
  }
}
