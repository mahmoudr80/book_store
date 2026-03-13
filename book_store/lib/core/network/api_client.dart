import 'package:book_store/core/network/api_constants.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final dio = Dio();

   Future<dynamic> login(Map<String,dynamic>json) async {
    Response response;
    String login=ApiConstants.baseUrl+ApiConstants.loginEndPoint;
    response = await dio.post(login,data: json);
   if(response.statusCode==200){
     return response.data;
   }
   else{
     throw Exception(response);
   }
  }

  Future<dynamic>register(Map<String,dynamic>json)async{
    Response response;
    String register=ApiConstants.baseUrl+ApiConstants.registerEndPoint;
    response = await dio.post(register, data:json);
    if(response.statusCode==201){
      return response.data;
    }
    else{
      throw Exception(response);
    }
  }
}