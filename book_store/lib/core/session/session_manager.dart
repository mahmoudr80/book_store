import 'package:book_store/core/helper/app_constants.dart';
import 'package:book_store/core/storage/local_storage_service.dart';
import 'package:book_store/core/storage/secure_storage_service.dart';

class SessionManager {
  final LocalStorageService _localStorage;
  final SecureStorageService _secureStorage;

  const SessionManager(this._localStorage, this._secureStorage);

  Future<void> saveSession(String token, String userJson) async {
    await _secureStorage.save(AppConstants.tokenSecureStorageKey, token);
    await _localStorage.save(AppConstants.userSharedPrefKey, userJson);
  }

  Future<String?> getToken() =>
      _secureStorage.get(AppConstants.tokenSecureStorageKey);
  String? getUser() {
    String? userJson = _localStorage.get(AppConstants.userSharedPrefKey);
   return userJson;
    }


  Future<void> clearSession() async {
    await _secureStorage.delete(AppConstants.tokenSecureStorageKey);
    await _localStorage.delete(AppConstants.userSharedPrefKey);
  }
}
