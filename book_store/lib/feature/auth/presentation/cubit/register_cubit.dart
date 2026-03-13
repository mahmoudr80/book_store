import 'package:bloc/bloc.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';
import 'package:book_store/feature/auth/domain/usecases/register_usecase.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

 Future<void> register(UserModel newUser) async {
   try{
     final user = await registerUseCase.call(newUser);
      emit(RegisterSuccess(user));
   }on DioException catch(e){
     emit(RegisterFailed(e.response?.data["message"].toString()??""));
   }
  }
}
