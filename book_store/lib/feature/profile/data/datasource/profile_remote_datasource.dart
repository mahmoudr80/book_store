import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/api_helper.dart';
import 'package:book_store/core/network/api_result.dart';

import '../model/user_model.dart';

class ProfileRemoteDatasource {
  final ApiHelper _helper;
  const ProfileRemoteDatasource(this._helper);

  Future<UserModel> getUser() async {
    final response=await _helper.get(path: ApiConstants.profileEndPoint);
    if(response is Success){
      UserModel userModel = UserModel.fromJson(response.data);
      return userModel;
    }else if (response is Failure){
      throw Exception(response.errorModel.error);
    }
    else{
      throw Exception("Un expected error");
    }
  }
}