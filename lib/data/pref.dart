import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static saveToken(String token) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString('token', token);
  }

  static Future<String?> getToken() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final token = _pref.getString('token');
    return token;
  }

  static Future<void> removeToken() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.remove('token');
  }
}
