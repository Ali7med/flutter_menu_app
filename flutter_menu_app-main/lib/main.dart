import 'package:flutter/material.dart';
import 'package:flutter_menu_app/utilities/utilities.dart';
import 'package:flutter_menu_app/views/IHome.dart';
import 'package:flutter_menu_app/views/ILogin.dart';
import 'package:shared_preferences/shared_preferences.dart';


 void  main() async {
   WidgetsFlutterBinding.ensureInitialized();
  // ignore: non_constant_identifier_names
  Widget Home;
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  // ignore: non_constant_identifier_names
  final String AccessToken=_prefs.getString(Utilities.Access_token);
  if(AccessToken==null){
    Home=ILogin();

  }else{
    Home=IHome();
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
      theme: ThemeData(primaryColor: Color.fromRGBO(63, 83, 108,1)),
    );
  }
}
