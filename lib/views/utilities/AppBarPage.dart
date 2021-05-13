import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../IHome.dart';

AppBar makeAppBar(BuildContext context , String title){
  return AppBar(
    title: Text(
      title,
      textAlign: TextAlign.center,
    ),
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    actions: <Widget>[
      Container(
        child: CupertinoContextMenu(actions: <Widget>[
          CupertinoContextMenuAction(
              child: Text('Home'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => IHome()));
              }),
        ], child: Icon(Icons.home)),
        padding: EdgeInsets.only(right: 10),
      ),
    ],
  );
}