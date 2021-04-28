
import 'package:flutter_menu_app/models/api/userApi.dart';
import 'package:flutter_menu_app/models/user/loginDTO.dart';
import 'package:flutter_menu_app/models/user/loginResponse.dart';
import 'package:flutter_menu_app/models/user/userDate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController{
  userApi userAPI = userApi();

 Future <List<User>> getUsers() async {
     List<User>  users=[];
  var data=await userAPI.getUser();
  for(var item in data){
   users.add(User.fromJson(item));
  }
  return users;
 }


  Future<bool> login(LoginDTO loginDTO) async{
   LoginResponse result = await userAPI.login(loginDTO);
    if(result!=null){
      SharedPreferences _pref=await SharedPreferences.getInstance();
       _pref.setString('access_token',result.access_token);
      return true;
    }
    return false;
  }

  Future<bool> isLogin() async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
    if(_pref.getString('access_token') !=null) return true;
    return false;
  }

  Future<bool> logout(){
   return userAPI.logout();
  }
}