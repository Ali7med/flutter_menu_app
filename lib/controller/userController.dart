import 'package:flutter_menu_app/models/api/userApi.dart';
import 'package:flutter_menu_app/models/user/RegisterDTO.dart';
import 'package:flutter_menu_app/models/user/loginDTO.dart';
import 'package:flutter_menu_app/models/user/loginResponse.dart';
import 'package:flutter_menu_app/models/user/userData.dart';
import 'package:flutter_menu_app/utilities/utilities.dart';

class UserController {
  UserApi _userAPI = UserApi();
  static String _user_name = "";
  static String _user_id = "";
  static String _accessToken = "";

  static void setUserName({String name}) => _user_name = name;

  static void setUserID({String id}) => _user_id = id;

  static void setUserAccessToken({String accessToken}) => _accessToken = accessToken;

  static String getUserName() => _user_name;

  static String getUserID() => _user_id;

  Future<List<User>> getUsers() async {
    List<User> users = [];
    var data = await _userAPI.getUser();
    for (var item in data) {
      users.add(User.fromJson(item));
    }
    return users;
  }

  Future<LoginResponse> login(LoginDTO loginDTO) async {
    LoginResponse result = await _userAPI.login(loginDTO);
    if (result != null) {
      Utilities.storeKey(Utilities.CurrentUserMap['accessToken'], result.accessToken);
      Utilities.storeKey(Utilities.CurrentUserMap['accessId'], result.id.toString());
      Utilities.storeKey(Utilities.CurrentUserMap['accessName'], result.name);
      setUserID(id: result.id.toString());
      setUserName(name: result.name);
    }
    return result;
  }

  Future<LoginResponse> register(RegisterDTO registerDTO) async {
    LoginResponse result = await _userAPI.register(registerDTO);
    if (result != null) {
      Utilities.storeKey(Utilities.accessToken, result.accessToken);
      setUserID(id: result.id.toString());
      setUserName(name: result.name);
    }
    return result;
  }

  Future<bool> isLogin() async {
    if (Utilities.getAccessToken() != null) return true;
    return false;
  }

  static Future<bool> logout() {
    setUserID(id: null);
    setUserName(name: null);
    return UserApi.logout();
  }
}
