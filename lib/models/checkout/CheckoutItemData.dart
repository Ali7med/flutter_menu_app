import 'dart:ffi';
import 'package:flutter_menu_app/models/item/ItemData.dart';

class CheckoutItem{
  static List<Item> _listItem=[];
  static List<Item> get listItem => _listItem;

  static void  addItem(Item item){
    _listItem.add(item);
  }
  static removeItem(Item item){
    _listItem.remove(item);
  }

}