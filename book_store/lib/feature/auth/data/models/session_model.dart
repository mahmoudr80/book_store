import 'package:book_store/feature/auth/data/models/user_model.dart';

class SessionModel {
  final String token;
  final AuthUserModel user;

  SessionModel({required this.token,required this.user});
}