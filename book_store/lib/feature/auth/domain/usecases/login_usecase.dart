import 'package:book_store/feature/auth/data/models/user_model.dart';
import 'package:book_store/feature/auth/domain/repository/auth_repository_interface.dart';

class LoginUseCase {
  final AuthRepositoryInterface repo;

  LoginUseCase(this.repo);

  Future<UserModel>call(String email,String password){
    return repo.login(email, password);
  }
}