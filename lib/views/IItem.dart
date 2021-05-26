import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/controller/itemController.dart';
import 'package:flutter_menu_app/models/category/category.dart';
import 'package:flutter_menu_app/models/checkout/CheckoutItemData.dart';
import 'package:flutter_menu_app/models/item/ItemData.dart';
import 'package:flutter_menu_app/models/language/languageData.dart';
import 'package:flutter_menu_app/views/utilities/AppBarPage.dart';
import 'package:flutter_menu_app/views/utilities/DrawerPage.dart';

// ignore: must_be_immutable
class IItem extends StatefulWidget {
  static String routeName = '/item';
  Language language;
  Category category;

  IItem(this.language, this.category);

  @override
  _IItemState createState() => _IItemState(language, category);
}

class _IItemState extends State<IItem> {
  Language language;
  Category category;
  ItemController itemController = ItemController();

  _IItemState(this.language, this.category);

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
    return FutureBuilder(
      future: itemController.getItemByLanguageCategoryID(
          lanID: language.id.toString(), catID: category.id.toString()),
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
              child: Text('No Items Here !!!'),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snap.data.length,
            itemBuilder: (context, index) {
              return _drawSingleHotStoriesCard(Colors.orange, snap.data[index]);
            },
          );
        }
      },
    );
  }

  Widget drawItem(Item data) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 120,
                height: 120,
                child: Image.network(
                  data.photo,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Text(data.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          data.categoryName,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.access_time),
                            Text(
                              '1 hour ago',
                              textAlign: TextAlign.right,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawSingleHotStoriesCard(Color _color, Item data) {
    return Container(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: CachedNetworkImage(
                placeholder: (context, url) {
                  return CircularProgressIndicator();
                } ,
                imageUrl: data.photo,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8, left: 16),
              child: Container(
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 3, bottom: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _color,
                ),
                child: Text(
                  data.categoryName,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8, left: 16),
              child: Container(
                padding:
                EdgeInsets.only(left: 24, right: 24, top: 3, bottom: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _color,
                ),
                child: Text(
                  data.showPrice(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: 2, bottom: 8, right: 16, left: 16),
                child: Text(
                  data.name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                )),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.grey,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '20 Min',
                      ),
                    ],
                  ),
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        CheckoutItem.addItem(data);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
