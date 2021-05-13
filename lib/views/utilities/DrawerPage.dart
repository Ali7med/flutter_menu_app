import 'package:flutter/material.dart';
import 'package:flutter_menu_app/controller/userController.dart';
import 'package:flutter_menu_app/views/IHome.dart';

import '../ILogin.dart';
import '../IRegister.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  UserController _userController = UserController();
  bool islogin=false;
  @override
  initState(){
    super.initState();
    _userController.isLogin().then((value) {
      setState(() {
        islogin = value;
      }
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Home(),
          islogin?Logout():Login(),
          islogin? Container():Registration()
        ],
      ),
    );
  }
// ignore: non_constant_identifier_names
  Widget Home() {
    return ListTile(
      title: Text('Home'),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => IHome()));
      },
    );
  }
  // ignore: non_constant_identifier_names
  Widget Logout() {
    return ListTile(
      title: Text('Logout'),
      onTap: () async {
            await _userController.logout()?islogin=false:islogin=true ; print(islogin);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ILogin()));
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget Registration() {
    return ListTile(
      title: Text('Registration'),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => IRegister()));
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget Login() {
    return ListTile(
      title: Text('Login'),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ILogin()));
      },
    );
  }
}






 Drawer  makeDrawer(BuildContext context)   {
  UserController _userController = UserController();
  var  islogin=_userController.isLogin()  ;

  return Drawer(
    child: Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => IHome()));
            },
          ),
          islogin != null?Logout(context):Login(context),
          islogin != null? Container():Registration(context)
        ],
      ),
    ),
  );
}
Widget Registration(context) {
  return ListTile(
    title: Text('Registration'),
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => IRegister()));
    },
  );
}
Widget Login(context) {
  return ListTile(
    title: Text('Login'),
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ILogin()));
    },
  );
}
Widget Logout(context) {
  UserController _userController = UserController();
  return ListTile(
    title: Text('Logout'),
    onTap: () async {
      await _userController.logout();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ILogin()));
    },
  );
}