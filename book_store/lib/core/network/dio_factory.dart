import 'package:book_store/core/network/api_constants.dart';
import 'package:dio/dio.dart';

class DioFactory {
  //Singleton pattern
  const DioFactory._();
  static Dio createDio() {
    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(
          seconds: ApiConstants.connectionTimeoutWithSec,
        ),
        receiveTimeout: const Duration(
          seconds: ApiConstants.receiveTimeoutWithSec,
        ),
      ),
    );
  }
}
