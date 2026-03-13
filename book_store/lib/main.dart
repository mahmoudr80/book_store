import 'package:book_store/book_store.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';
import 'package:book_store/feature/auth/domain/usecases/register_usecase.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/dependency_injection/service_locator.dart';

void main() async{
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'),Locale('ar')], path: 'assets/translations',
    fallbackLocale: Locale('en'),
    child: const BookStore(),
      ));


}


//dart run easy_localization:generate -S assets/translations -O lib/gen/translations -o local_keys.g.dart -f keys

//dart run build_runner build --delete-conflicting-outputs

// configureDependencies();
// try{
// final register = getIt<RegisterUseCase>();
// final user = await register.call(UserModel(name: 'Mahmoud', email: 'mahmxcdxdeoudr008@gmail.com',
// password: '12345678',password_confirmation: '12345678'));
// print("${user.name} &${user.email} ");
// }on DioException catch(e){
// print(e.response?.data["message"].toString());
// }
//
// configureDependencies();
// try{
// final login = getIt<LoginUseCase>();
// final user = await login("mahmoudr80@gmail.com","12345678");
// print("${user.name} &${user.email} ");
// }catch(e){
// print(e.toString());
// }