import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferences _pref;

  const LocalStorageService(this._pref);

  Future<void> save(String key, String value) async {
    await _pref.setString(key, value);
  }

  String? get(String key) {
    final value = _pref.getString(key);
    return value;
  }

  Future<void> delete(String key) async {
    await _pref.remove(key);
  }

  Future<void> clear() async {
    await _pref.clear();
  }
}
