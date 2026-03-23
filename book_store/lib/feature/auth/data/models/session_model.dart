import 'package:book_store/feature/auth/data/models/user_model.dart';

class SessionModel {
  final String token;
  final UserModel user;

  SessionModel({required this.token,required this.user});
}