import '../../data/models/user_model.dart';
import '../repository/auth_repository_interface.dart';

class RegisterUseCase {
  final AuthRepositoryInterface repo;

  RegisterUseCase(this.repo);
  Future<UserModel>call(UserModel user){
    return repo.register(user);
  }
}