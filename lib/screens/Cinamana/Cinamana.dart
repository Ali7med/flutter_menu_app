import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/screens/Cinamana/categories.dart';
import 'package:flutter_menu_app/screens/Cinamana/home.dart';
import 'package:flutter_menu_app/screens/Cinamana/profile.dart';
import 'package:flutter_menu_app/screens/Cinamana/search.dart';

class Cinaman extends StatefulWidget {
  @override
  _CinamanState createState() => _CinamanState();

}

class _CinamanState extends State<Cinaman> {
  int _seletcedIndex=0;
  static List<Widget> pages= <Widget>[
    Home(),
    Categories(),
    Search(),
    Profile()
  ];

  void changePage(int index){
    setState((){
      _seletcedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinamana'),
      ),
      body:pages.elementAt(_seletcedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _seletcedIndex,
        onTap: changePage,
        backgroundColor: Color.fromRGBO(4, 21, 31, 1),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text('Home',style: TextStyle(color: Colors.white54),),
              icon: Icon(
                Icons.home,
                color: Colors.white54,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.white,
              )),
          BottomNavigationBarItem(
              title: Text('Categories',style: TextStyle(color: Colors.white54),),

              icon: Icon(
                Icons.category,
                color: Colors.white54,
              ),
              activeIcon: Icon(
                Icons.category,
                color: Colors.white,
              )),
          BottomNavigationBarItem(
              title: Text('Profile',style: TextStyle(color: Colors.white54),),
              icon: Icon(
                Icons.person_pin,
                color: Colors.white54,
              ),
              activeIcon: Icon(
                Icons.person_pin,
                color: Colors.white,
              )),

        ],
      ),
    );
  }
}
