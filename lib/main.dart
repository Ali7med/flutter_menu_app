import 'package:flutter/material.dart';
import 'package:flutter_menu_app/screens/Cinamana/Cinamana.dart';
import 'package:flutter_menu_app/screens/multi2.dart';
import 'package:flutter_menu_app/screens/mutli_screen.dart';
import 'package:flutter_menu_app/views/IUser.dart';


void main() {
  runApp(MyApp());
}


class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromRGBO(4, 21, 31,1)),
    );
  }
}

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var Xcount = 0;

   AddValue(BuildContext context) {
    setState(() {
      Xcount++;
       final snackBar = SnackBar(content: Text('Xcount is $Xcount'));
       _scaffoldKey.currentState.showSnackBar(snackBar);
      _scaffoldKey.currentState.openDrawer();

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body:
      Builder(
        builder:(context)=> Container(
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    AddValue(context);
                  },
                  child: Text("Add Value")
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                  child: Text('Count is $Xcount'))
              ,
               Image.asset("assets/images/1.jpg")
            ],
          ),
        ),
      ),
      drawer: Drawer(
        semanticLabel: "Drower",
        child: Container(
          padding: EdgeInsets.only(top: 25),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Icon(Icons.home_work_rounded),
                      Text(
                        "Home",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  )),
              FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.electrical_services),
                      Text(
                        "Servics",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Color.fromRGBO(4, 21, 31,1)),
      home: Cinaman(),
      debugShowCheckedModeBanner: false,
    );
  }
}

