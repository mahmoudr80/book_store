import 'package:book_store/core/network/api_client.dart';
import 'package:book_store/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:book_store/feature/auth/data/repository/auth_repositoryImp.dart';
import 'package:book_store/feature/auth/domain/repository/auth_repository_interface.dart';
import 'package:book_store/feature/auth/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../feature/auth/domain/usecases/register_usecase.dart';

// Create a global instance (or use GetIt.instance)
final getIt = GetIt.instance;
// 1. Define your services
// 2. Register them at app startup
void configureDependencies(){
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(),);
  getIt.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasource(getIt<ApiClient>()),);
  getIt.registerLazySingleton<AuthRepositoryInterface>(() => AuthRepositoryImp(getIt<AuthRemoteDatasource>()),);
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt<AuthRepositoryInterface>()),);
  getIt.registerLazySingleton<RegisterUseCase>(() =>RegisterUseCase(getIt<AuthRepositoryInterface>()) ,);
}

// No BuildContext passing needed!
// getIt<UserRepository>().apiClient.fetchData();