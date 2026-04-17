import 'package:bloc/bloc.dart';
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

}
