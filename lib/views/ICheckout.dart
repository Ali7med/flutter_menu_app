import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/models/checkout/CheckoutItemData.dart';
import 'package:flutter_menu_app/models/item/ItemData.dart';
import 'package:flutter_menu_app/views/utilities/AppBarPage.dart';
import 'package:flutter_menu_app/views/utilities/DrawerPage.dart';

class ICheckOut extends StatefulWidget {
  const ICheckOut({Key key}) : super(key: key);

  @override
  _ICheckOutState createState() => _ICheckOutState();
}

class _ICheckOutState extends State<ICheckOut> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: makeAppBar(context, 'Choose Item'),
      drawer: makeDrawer(context),
      body: page(context),
    );
  }

  Widget page(BuildContext context) {
    print(CheckoutItem.listItem.length);
    return ListView.builder(
      itemCount: CheckoutItem.listItem.length,
      itemBuilder: (BuildContext context, int index) {
        return itemDraw(CheckoutItem.listItem[index]);
      },
    );
  }

  Widget itemDraw(Item item) {
    return Card(
        child: ListTile(
      leading: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {},
      ),
      title: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(item.name , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Text(item.showPrice()+" "+ item.languageCurr, style: TextStyle(fontSize: 12),)
            ],
          ),
          IconButton(onPressed: (){}  ,  icon:Icon(Icons.add))
        ],
      ),
      trailing: FlutterLogo(size: 56.0),
    ));
  }
}
