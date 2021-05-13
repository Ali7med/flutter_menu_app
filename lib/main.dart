import 'package:flutter/material.dart';
import 'package:flutter_menu_app/utilities/utilities.dart';
import 'package:flutter_menu_app/views/IHome.dart';
import 'package:flutter_menu_app/views/ILogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/userController.dart';


 void  main() async {
   WidgetsFlutterBinding.ensureInitialized();
  Widget _home;
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  final String _accessToken=_prefs.getString("access_token");
  if(_accessToken==null){
    _home=ILogin();
  }else{
    _home=IHome();
     Utilities.getUserName();
     Utilities.getUserID();
     Utilities.getAccessToken();
  }
  runApp(App(_home));
}

// ignore: must_be_immutable
class App extends StatelessWidget {
    Widget _homeScreen;
    App(this._homeScreen);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home:  _homeScreen,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromRGBO(63, 83, 108,1)),
    );
  }
}
