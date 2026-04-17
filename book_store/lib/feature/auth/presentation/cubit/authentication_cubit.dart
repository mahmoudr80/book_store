import 'package:bloc/bloc.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';

import '../../data/repository/auth_repository.dart';
part 'authentication_state.dart';

enum EnAction{login,register,forgetPassword,verifyEmail,changePassword}
enum EnStatus{idle,success,fail,loading}

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.repo) : super(AuthenticationState());
  final AuthRepository repo;


  Future<void> login(String email,String password) async {
    emit(state.copyWith(status: EnStatus.loading,action: EnAction.login));
    try{
      final AuthUserModel user = await repo.login(email, password);
      emit(state.copyWith(status: EnStatus.success,action: EnAction.login,user: user));
    } catch(e){
      final message = e.toString().replaceFirst('Exception: ', '');
      emit(state.copyWith(status: EnStatus.fail,action: EnAction.login,error: message));
    }
  }
  Future<void> register(AuthUserModel newUser) async {
    emit(state.copyWith(action: EnAction.register,status: EnStatus.loading));
    try{
      final user = await repo.register(newUser);
      emit(state.copyWith(action: EnAction.register,status: EnStatus.success,user: user));

    } catch(e){
      final message = e.toString().replaceFirst('Exception: ', '');
      emit(state.copyWith(action: EnAction.register,status: EnStatus.fail,error: message));
    }
  }
}

