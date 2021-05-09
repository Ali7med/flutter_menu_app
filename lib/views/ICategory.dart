import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/controller/categoryController.dart';
import 'package:flutter_menu_app/models/category/category.dart';
import 'package:flutter_menu_app/models/language/languageData.dart';
import 'package:flutter_menu_app/views/IItem.dart';
import 'package:flutter_menu_app/views/utilities/DrawerPage.dart';

class ICategory extends StatefulWidget {
  final Language language;

  ICategory(this.language);

  @override
  _ICategoryState createState() => _ICategoryState(language);
}

class _ICategoryState extends State<ICategory> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  CategoryController categoryController = CategoryController();
  final Language language;

  _ICategoryState(this.language);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Category"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      drawer: Drawer(
        child: DrawerPage(),
      ),
      body: page(context),
    );
  }

  Widget page(BuildContext context) {
    return FutureBuilder(
      future: categoryController.getCategoryByLanguageID(language.Id),
      builder: (context, AsyncSnapshot<List<Category>> snap) {
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
              child: Text('No Category Here !!!'),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snap.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  snap.data[index].Name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  snap.data[index].Description,
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => IItem(language, snap.data[index])));
                },
              );
            },
          );
        }
      },
    );
  }
}
