import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/api_error_handler.dart';
import 'package:book_store/core/network/api_error_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_result.dart';

class ApiHelper {
  final Dio _dio;

 const ApiHelper(this._dio);


  Future<ApiResult<dynamic>> post(String path,{dynamic data}) async {
    try{
      final response = await _dio.post(path,data: data);
      return ApiResult.success(response.data);
    }catch(error){
      // return structured error model cause ui better to use structural data
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<dynamic>> get(String path) async {
    try{
      final response = await _dio.get(path);
      _dio.interceptors.add(PrettyDioLogger());

// customization
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          enabled: kDebugMode,
          filter: (options, args){
            // don't print requests with uris containing '/posts'
            if(options.path.contains('/posts')){
              return false;
            }
            // don't print responses with unit8 list data
            return !args.isResponse || !args.hasUint8ListData;
          }
      )
      );

      if(response.statusCode==200){
        return ApiResult.success(response.data);
      }
      else{
        return ApiResult.failure(ApiErrorModel(error: "UnExpected Error",code: response.statusCode));
      }

    }catch(error){
      // return structured error model cause ui better to use structural data
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

}