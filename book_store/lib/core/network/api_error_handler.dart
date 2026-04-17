import 'dart:io';
import 'package:book_store/core/dependency_injection/service_locator.dart';
import 'package:book_store/core/session/session_manager.dart';
import 'package:dio/dio.dart';
import 'api_error_model.dart';

abstract class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.badResponse:
          final errors = error.response?.data["errors"];
          if (errors != null && errors is Map && errors.isNotEmpty) {
            final firstKey = errors.keys.first;
            final firstValue = errors[firstKey];
            if (firstValue is List && firstValue.isNotEmpty) {
              return ApiErrorModel(
                error: firstValue.first.toString(),
                code: error.response?.statusCode,
              );
            } else {
              return ApiErrorModel(error: "Unexpected error");
            }
          }
          else if(error.response!=null&& error.response!.statusCode==401){
            getIt<SessionManager>().clearSession();
            return ApiErrorModel(
              error: error.response?.data["message"],
              code: error.response?.statusCode,
            );
          }
          else {
            return ApiErrorModel(
              error: error.response?.data["message"],
              code: error.response?.statusCode,
            );
          }
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(error: "Server is too slow");
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(error: "Request takes too long to send");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(error: "Response takes too long");
        case DioExceptionType.cancel:
          return ApiErrorModel(error: "Request was manually cancelled");
        case DioExceptionType.unknown:
          return ApiErrorModel(error: "No internet OR unexpected error");
        default:
          return ApiErrorModel(error: "Unexpected error");
      }
    } else if (error is SocketException) {
      return ApiErrorModel(error: "No internet connection");
    } else {
      return ApiErrorModel(error: "Unexpected error");
    }
  }
}
