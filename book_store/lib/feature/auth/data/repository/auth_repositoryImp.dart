
import 'package:book_store/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';
import 'package:book_store/feature/auth/domain/repository/auth_repository_interface.dart';

class AuthRepositoryImp extends AuthRepositoryInterface {
  AuthRemoteDatasource datasource;

  AuthRepositoryImp(this.datasource);


  @override
  Future<UserModel> login(String email, String password)async {
    final user = await datasource.login({"email":email,"password":password});
    return user;
  }

  @override
  Future<UserModel> register(UserModel newUser) async {
   final user = await datasource.register(newUser.toJson());
   return user;
  }

}