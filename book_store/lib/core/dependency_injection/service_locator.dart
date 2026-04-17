import 'package:book_store/core/network/api_helper.dart';
import 'package:book_store/core/network/dio_factory.dart';
import 'package:book_store/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:book_store/feature/auth/data/repository/auth_repository.dart';
import 'package:book_store/feature/cart/data/repository/home_repository.dart';
import 'package:book_store/feature/home/data/datasources/home_remote_datasource.dart';
import 'package:book_store/feature/home/data/repository/home_repository.dart';
import 'package:book_store/feature/profile/data/datasource/profile_remote_datasource.dart';
import 'package:book_store/feature/profile/data/repository/profile_repository.dart';
import 'package:book_store/feature/wish_list/data/datasource/wish_list_remote_datasource.dart';
import 'package:book_store/feature/wish_list/data/repositories/wish_list_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/cart/data/datasources/cart_remote_datasource.dart';
import '../../feature/cart/domain/repository/cart_repo.dart';
import '../session/session_manager.dart';
import '../storage/local_storage_service.dart';
import '../storage/secure_storage_service.dart';

// Create a global instance (or use GetIt.instance)
final getIt = GetIt.instance;
// 1. Define your services
// 2. Register them at app startup
void configureDependencies(){
  getIt.registerLazySingleton<Dio>(() => DioFactory.createDio(),);
  getIt.registerLazySingleton<ApiHelper>(() => ApiHelper(getIt<Dio>()),);
  getIt.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasource(getIt<ApiHelper>()),);
  getIt.registerLazySingleton<HomeRemoteDatasource>(() => HomeRemoteDatasource(getIt<ApiHelper>()),);
  getIt.registerLazySingleton<ProfileRemoteDatasource>(() => ProfileRemoteDatasource(getIt<ApiHelper>()),);
  getIt.registerLazySingleton<CartRemoteDatasource>(() => CartRemoteDatasource(getIt<ApiHelper>()),);
  getIt.registerLazySingleton<WishListRemoteDatasource>(() => WishListRemoteDatasource(getIt<ApiHelper>()),);
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt<AuthRemoteDatasource>(),getIt<SessionManager>()),);
  getIt.registerLazySingleton<CartRepositoryImpl>(() => CartRepositoryImpl(getIt<CartRemoteDatasource>()),);
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt<HomeRemoteDatasource>()),);
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository(getIt<ProfileRemoteDatasource>()),);
  getIt.registerLazySingleton<WishListRepository>(() => WishListRepository(getIt<WishListRemoteDatasource>()),);
  getIt.registerLazySingleton<FlutterSecureStorage>(() => FlutterSecureStorage(),);
  getIt.registerSingletonAsync<SharedPreferences>(() async =>await SharedPreferences.getInstance(),);
  getIt.registerLazySingleton<LocalStorageService>(() =>LocalStorageService( getIt<SharedPreferences>()),);
  getIt.registerLazySingleton<SecureStorageService>(()=>SecureStorageService(getIt<FlutterSecureStorage>()));
  getIt.registerLazySingleton<SessionManager>(() => SessionManager(getIt<LocalStorageService>(), getIt<SecureStorageService>()));
}

// No BuildContext passing needed!
// getIt<UserRepository>().apiClient.fetchData();