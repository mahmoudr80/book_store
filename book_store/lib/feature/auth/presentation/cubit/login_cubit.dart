import 'package:bloc/bloc.dart';
import 'package:book_store/feature/auth/data/repository/auth_repositoryImp.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../../data/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
final AuthRepository repo;
  LoginCubit(this.repo) : super(LoginInitial());

 Future<void> login(String email,String password) async {
   emit(LoginLoading());
    try{
      final UserModel user = await repo.login(email, password);
      emit(LoginSuccess(user));
    } catch(e){
      emit(LoginFailed(e.toString()));
      }
    }
  }

