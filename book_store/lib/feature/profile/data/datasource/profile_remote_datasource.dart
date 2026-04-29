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
  Future<bool> updateUser(String name,String phone,String address) async {
    final response=await _helper.post( ApiConstants.updateUserEndPoint
    ,data: {
          "name":name,
          "address" :address,
          "phone":phone
        });
    if(response is Success){
     return true;
    }
    else{
      return false;    }
  }
  Future<bool> resetPassword(String currentPass,String newPass,String confirmPass) async{
    final response=await _helper.post( ApiConstants.resetPasswordEndPoint
        ,data: {
          "current_password":currentPass,
          "new_password" :newPass,
          "new_password_confirmation":confirmPass
        });
    if(response is Success){
      return true;
    }
    else{
      return false;    }
  }
}