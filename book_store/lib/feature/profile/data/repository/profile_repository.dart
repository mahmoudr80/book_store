import 'package:book_store/feature/profile/data/datasource/profile_remote_datasource.dart';

import '../model/user_model.dart';

class ProfileRepository {
  final ProfileRemoteDatasource _datasource;
  const ProfileRepository(this._datasource);

  Future<UserModel>getUser() async {
    return await _datasource.getUser();
  }
}