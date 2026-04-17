
import 'dart:convert';

import 'package:book_store/core/session/session_manager.dart';
import 'package:book_store/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';

class AuthRepository  {
 final AuthRemoteDatasource _remoteDatasource;
 final SessionManager _manager ;
 const AuthRepository(this._remoteDatasource,  this._manager);


  Future<AuthUserModel> login(String email, String password)async {
    final sessionModel = await _remoteDatasource.login({"email":email,"password":password});
    _manager.saveSession(sessionModel.token,jsonEncode(sessionModel.user.toJson()));
    return sessionModel.user;
  }

  Future<AuthUserModel> register(AuthUserModel newUser) async {
   final sessionModel = await _remoteDatasource.register(newUser.toJson());
   _manager.saveSession(sessionModel.token,jsonEncode(sessionModel.user.toJson()));
   return sessionModel.user;
  }


}