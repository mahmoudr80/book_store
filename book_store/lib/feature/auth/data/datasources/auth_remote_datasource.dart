import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/api_helper.dart';
import 'package:book_store/core/network/api_result.dart';
import 'package:book_store/feature/auth/data/models/session_model.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';

class AuthRemoteDatasource {
final ApiHelper _helper;

const AuthRemoteDatasource(this._helper);


Future<SessionModel> login(Map<String,dynamic>json) async {

  final response = await _helper.post(ApiConstants.loginEndPoint,data: json);
  if(response is Success){
    final user =UserModel.fromJson(response.data["data"]["user"]);
    final token = response.data["data"]["token"];
    return SessionModel(token: token, user: user);
  }
  else if(response is Failure){
    throw Exception(response.errorModel.error);
  }
  else{
    throw Exception("Unexpected error");
  }
}

Future<SessionModel> register(Map<String,dynamic>json) async {
  final response = await _helper.post(ApiConstants.registerEndPoint,data: json);
  if(response is Success){
    final user =UserModel.fromJson(response.data["data"]["user"]);
    final token = response.data["data"]["token"];
    return SessionModel(token: token, user: user);
  }
  else if(response is Failure){
    throw Exception(response.errorModel.error);
  }
  else{
    throw Exception("Unexpected error");
  }

}

}