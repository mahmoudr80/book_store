import 'package:bloc/bloc.dart';
import 'package:book_store/feature/auth/domain/usecases/login_usecase.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../core/dependency_injection/service_locator.dart';
import '../../data/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

 Future<void> login(String email,String password) async {
    try{
      final UserModel user = await loginUseCase.call(email, password);
      emit(LoginSuccess(user));
    } on DioException catch(e){
      emit(LoginFailed(e.response?.data["message"].toString()??""));
    }
  }
}
