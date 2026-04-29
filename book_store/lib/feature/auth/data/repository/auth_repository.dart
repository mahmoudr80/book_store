
import 'dart:convert';

import 'package:book_store/core/network/api_result.dart';
import 'package:book_store/core/session/session_manager.dart';
import 'package:book_store/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';

class AuthRepository  {
 final AuthRemoteDatasource _remoteDatasource;
 final SessionManager _manager ;
 const AuthRepository(this._remoteDatasource,  this._manager);


  Future<ApiResult<AuthUserModel>> login(String email, String password)async {
    final sessionModel = await _remoteDatasource.login({"email":email,"password":password});
    switch (sessionModel){
      case Success(data:final session):
        _manager.saveSession(session.token,jsonEncode(session.user.toJson()));
        return ApiResult.success(session.user);
      case Failure(errorModel:final error):
        return ApiResult.failure(error);
    }

  }

  Future<ApiResult<AuthUserModel>> register(AuthUserModel newUser) async {
   final sessionModel = await _remoteDatasource.register(newUser.toJson());
   switch(sessionModel){
     case Success(data:final session):
       _manager.saveSession(session.token,jsonEncode(session.user.toJson()));
       return ApiResult.success(session.user);
     case Failure(errorModel:final error):
       return ApiResult.failure(error);
   }
  }

}