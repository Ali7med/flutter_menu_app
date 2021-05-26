import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/controller/languageController.dart';
import 'package:flutter_menu_app/controller/userController.dart';
import 'package:flutter_menu_app/models/language/languageData.dart';
import 'package:flutter_menu_app/views/ICategory.dart';
import 'package:flutter_menu_app/views/ILogin.dart';
import 'package:flutter_menu_app/views/utilities/DrawerPage.dart';

class IHome extends StatefulWidget {
  @override
  _IHomeState createState() => _IHomeState();
}

class _IHomeState extends State<IHome> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  LanguageController languageController = LanguageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => showInSnackBar('welcome ' + UserController.getUserName()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO : do than
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: makeDrawer(context),
      body: page(context),
    );
  }

  Widget page(BuildContext context) {
    var data = languageController.getLanguages();
    return FutureBuilder(
      future: data,
      builder: (context, AsyncSnapshot<List<Language>> snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snap.connectionState == ConnectionState.none ||
            snap.data == null) {
          return Container(
            child: Center(
              child: Text('No Language Here !!!'),
            ),
          );
        } else {
          if (snap.data.length == 0) {
            UserController.logout();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ILogin()));
            return Container(child: Text('NoAuthentication'));
          } else {
            return ListView.builder(
              itemCount: snap.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        snap.data[index].name,
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  subtitle: Text(
                    snap.data[index].note,
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ICategory(snap.data[index])));
                  },
                );
              },
            );
          }
        }
      },
    );
  }

  void showInSnackBar(String value) {
    scaffoldKey.currentState.showSnackBar(
        new SnackBar(
              content: new Text(value),
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              behavior: SnackBarBehavior.floating,
    ));
  }
}
