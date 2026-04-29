import 'package:bloc/bloc.dart';
import 'package:book_store/core/dependency_injection/service_locator.dart';
import 'package:book_store/core/session/session_manager.dart';
import 'package:book_store/feature/auth/data/repository/auth_repository.dart';
import 'package:book_store/feature/profile/data/repository/profile_repository.dart';
import 'package:meta/meta.dart';

import '../../data/model/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repository) : super(ProfileInitial());
  final ProfileRepository _repository;

  Future <void> getUser() async {
    if(isClosed){
      return;
    }
    emit(GetUserLoading());
    try{
      final UserModel user= await _repository.getUser();
      if(isClosed){
        return;
      }
      emit(GetUserSuccess(user));
    }catch(e){
      if(isClosed){
        return;
      }
      emit(GetUserFailed(e.toString()));
    }
  }

  Future<void> logout() async {
    await getIt<SessionManager>().clearSession();
    emit(LogoutSuccess());
  }
Future<void>updateProfile(String name,String phone,String address)async{
    final response=await _repository.updateUser(name, phone, address);
    if(response){
      getUser();
    }
}
  Future<void>resetPassword(String currentPass,String newPass,String confirmPass)async{
    final response=await _repository.resetPassword(currentPass, newPass, confirmPass);
    if(response){
      emit(ResetPasswordSuccess());
    }
  }
}
