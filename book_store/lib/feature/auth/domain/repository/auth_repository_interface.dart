import '../../data/models/user_model.dart';

abstract class AuthRepositoryInterface {
    Future<UserModel>login(String email,String password);
    Future<UserModel>register(UserModel user);
}