import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/views/IItem.dart';

// final Map<String, WidgetBuilder>routes = {
//   IItem.routeName: (context) => IItem(),
// }

// ignore: non_constant_identifier_names
void RouterNvai (BuildContext context, Widget page){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page ));
}

