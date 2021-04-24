
import 'package:flutter_menu_app/models/api/user.dart';
import 'package:flutter_menu_app/models/user/user.dart';

class UserController{
  UserApi userAPI = UserApi();

 Future <List<User>> getUsers() async {
     List<User>  users=[];
  var data=await userAPI.getUser();
  for(var item in data){
   users.add(User.fromJson(item));
  }
  return users;
 }
}