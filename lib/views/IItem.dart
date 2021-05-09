import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/controller/itemController.dart';
import 'package:flutter_menu_app/models/category/category.dart';
import 'package:flutter_menu_app/models/item/ItemData.dart';
import 'package:flutter_menu_app/models/language/languageData.dart';
import 'package:flutter_menu_app/views/utilities/DrawerPage.dart';

class IItem extends StatefulWidget {
  Language language;
  Category category;

 IItem(this.language, this.category );

  @override
  _IItemState createState() => _IItemState(language,category);
}

class _IItemState extends State<IItem> {
  Language language;
  Category category;
ItemController itemController=ItemController();

  _IItemState(this.language, this.category);
var scaffoldKey =GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Choose Item"),
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
      future: itemController.getItemByLanguageCategoryID(lanID:language.Id.toString(),catID: category.Id.toString() ),
      builder: (context, AsyncSnapshot<List<Item>> snap) {
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
                  snap.data[index].ItemName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  snap.data[index].photo,
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => IItem(language, snap.data[index])));
                },
              );
            },
          );
        }
      },
    );
  }

}
