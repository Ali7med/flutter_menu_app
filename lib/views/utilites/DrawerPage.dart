import 'package:flutter/material.dart';
import 'package:flutter_menu_app/controller/userController.dart';

import '../ILogin.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    bool islogin=true;
    setState(() {
      _userController.isLogin().then((value) => islogin);
    });
    return Container(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          islogin?Logout():Login(),
          islogin? Container():Registration()
        ],
      ),
    );
  }

  Widget Logout() {
    return ListTile(
      title: Text('Logout'),
      onTap: () {
        //setState(() => islogin=_userController.logout());
      },
    );
  }

  Widget Registration() {
    return ListTile(
      title: Text('Registration'),
      onTap: () {
        // Update the state of the app.
        // ...
      },
    );
  }

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
