import 'package:bloc/bloc.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';
import 'package:book_store/feature/auth/data/repository/auth_repositoryImp.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository repo;
  RegisterCubit(this.repo) : super(RegisterInitial());

 Future<void> register(UserModel newUser) async {
   try{
     final user = await repo.register(newUser);
      emit(RegisterSuccess(user));
   } catch(e){
     emit(RegisterFailed(e.toString()));
   }
  }
}
