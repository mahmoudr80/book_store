import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/api_error_handler.dart';
import 'package:dio/dio.dart';

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

}