import 'package:bloc/bloc.dart';
import 'package:book_store/core/network/api_result.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';

import '../../data/repository/auth_repository.dart';
part 'authentication_state.dart';

enum EnAction{login,register,forgetPassword,verifyEmail,changePassword}
enum EnStatus{idle,success,fail,loading}

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.repo) : super(AuthenticationState());
  final AuthRepository repo;


  Future<void> login(String email,String password) async {
    if(isClosed){return;}
    emit(state.copyWith(status: EnStatus.loading,action: EnAction.login));

      final  response = await repo.login(email, password);
      switch(response){
        case Success(data:final user):
          if(isClosed){return;}
          emit(state.copyWith(status: EnStatus.success,action: EnAction.login,user: user));
        case Failure(errorModel:final error):
          if(isClosed){return;}
          emit(state.copyWith(status: EnStatus.fail,action: EnAction.login,error: error.error));

      }

          }
  Future<void> register(AuthUserModel newUser) async {
    if(isClosed){return;}
    emit(state.copyWith(action: EnAction.register,status: EnStatus.loading));
      final response = await repo.register(newUser);
      switch(response){
        case Success(data:final user):
          if(isClosed){return;}
          emit(state.copyWith(action: EnAction.register,status: EnStatus.success,user: user));
        case Failure(errorModel:final error):
          if(isClosed){return;}
          emit(state.copyWith(action: EnAction.register,status: EnStatus.fail,error: error.error));
      }



  }
}

