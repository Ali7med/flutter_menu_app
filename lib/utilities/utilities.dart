import 'package:flutter_menu_app/controller/userController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utilities {
  static const String accessToken = "accessToken";
  static const String accessName = "userName";
  static const String accessId = "userId";
  static const Map<String, String> CurrentUserMap = {
    'accessToken': 'accessToken',
    'accessName': 'userName',
    'accessId': 'userId'
  };

  static Future<String> getAccessToken() async {
    SharedPreferences _perf = await SharedPreferences.getInstance();
    String _accessToken = _perf.getString(Utilities.accessToken);
    UserController.setUserAccessToken(accessToken: _accessToken);
    return _accessToken;
  }

  static Future<String> getUserName() async {
    SharedPreferences _perf = await SharedPreferences.getInstance();
    String _userName = _perf.getString(Utilities.accessName);
    UserController.setUserName(name: _userName);
    return _userName;
  }

  static Future<String> getUserID() async {
    SharedPreferences _perf = await SharedPreferences.getInstance();
    String _user_id = _perf.getString(Utilities.accessId);
    UserController.setUserID(id: _user_id);
    return _user_id;
  }

  static Future<bool> storeKey(key, value) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString(key, value);
  }

  static Future<bool> removeKey(key) async {
    SharedPreferences _perf = await SharedPreferences.getInstance();
    try {
      _perf.remove(key);
      return true;
    } catch (e) {
      print(e.toString());
    }
    return false;
  }
}
