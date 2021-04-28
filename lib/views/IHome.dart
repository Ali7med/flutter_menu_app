import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/views/utilites/DrawerPage.dart';

class IHome extends StatefulWidget {
  @override
  _IHomeState createState() => _IHomeState();
}

class _IHomeState extends State<IHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Page(),
      drawer: Drawer(
        child:DrawerPage() ,
      ),
    );
  }
  Widget Page(){
    return  SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          color: Color.fromRGBO(230, 230, 230, 1),
          child:  Text('Welcome Home'),
        ));
  }
}
