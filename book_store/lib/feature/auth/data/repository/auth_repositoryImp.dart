
import 'package:book_store/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository  {
 final AuthRemoteDatasource _datasource;

 const AuthRepository(this._datasource);


  Future<UserModel> login(String email, String password)async {
    final user = await _datasource.login({"email":email,"password":password});
    //saveToken(token)
    return user;
  }

  Future<UserModel> register(UserModel newUser) async {
   final user = await _datasource.register(newUser.toJson());
   return user;
  }

  static Future<void> saveToken(String token) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
// Save an integer value to 'counter' key.
    await prefs.setString('token',token);
    /// todo token
    print("token saved");
  }

}