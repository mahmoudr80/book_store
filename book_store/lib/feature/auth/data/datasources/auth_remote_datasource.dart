
import 'package:book_store/core/network/api_client.dart';
import 'package:book_store/feature/auth/data/models/user_model.dart';

class AuthRemoteDatasource {
final ApiClient client;

AuthRemoteDatasource(this.client);

Future<UserModel> login(Map<String,dynamic>json) async {

  final data = await client.login(json);
  final user =UserModel.fromJson(data["data"]["user"]);
  return user;
}

Future<UserModel> register(Map<String,dynamic>json) async {

  final data = await client.register(json);
  final user =UserModel.fromJson(data["data"]["user"]);
  return user;
}
}