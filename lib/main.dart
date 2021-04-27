import 'package:flutter/material.dart';
import 'package:flutter_menu_app/screens/Cinamana/Cinamana.dart';
import 'package:flutter_menu_app/screens/multi2.dart';
import 'package:flutter_menu_app/screens/mutli_screen.dart';
import 'package:flutter_menu_app/views/IUser.dart';
import 'package:flutter_menu_app/views/ILogin.dart';
import 'package:shared_preferences/shared_preferences.dart';


 void  main() async {
   WidgetsFlutterBinding.ensureInitialized();
  // ignore: non_constant_identifier_names
  Widget Home;
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  final String _access_token=_prefs.getString('access_token');
  if(_access_token==null){
    Home=ILogin();
  }else{
    Home=IUser();
  }
  runApp(App(Home));
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
      theme: ThemeData(primaryColor: Color.fromRGBO(4, 21, 31,1)),
    );
  }
}
