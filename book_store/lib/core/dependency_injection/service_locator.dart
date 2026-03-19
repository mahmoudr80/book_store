import 'package:book_store/core/network/api_helper.dart';
import 'package:book_store/core/network/dio_factory.dart';
import 'package:book_store/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:book_store/feature/auth/data/repository/auth_repositoryImp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// Create a global instance (or use GetIt.instance)
final getIt = GetIt.instance;
// 1. Define your services
// 2. Register them at app startup
void configureDependencies(){
  getIt.registerLazySingleton<Dio>(() => DioFactory.createDio(),);
  getIt.registerLazySingleton<ApiHelper>(() => ApiHelper(getIt<Dio>()),);
  getIt.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasource(getIt<ApiHelper>()),);
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt<AuthRemoteDatasource>()),);
}

// No BuildContext passing needed!
// getIt<UserRepository>().apiClient.fetchData();