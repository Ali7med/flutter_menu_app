import 'dart:ffi';
import 'package:intl/intl.dart';
class Item {
  int _id,_price,_categoryId,_languageId, _count=0;
  String _name, _photo,_categoryName ,_languageName,_languageCurr;

  Item(this._id, this._name, this._photo, this._price, this._languageId, this._languageName,
      this._categoryId,this._categoryName,this._languageCurr);

  Item.fromJson(Map<String, dynamic> map) {
    try{
      this._id = map['id'];
      this._name = map['name'];
      this._photo = map['photo'];
      this._price = map['price'];
      this._languageId =  map['languageId'];
      this._languageName =  map['languageName'];
      this._categoryId = map['categoryId'];
      this._categoryName = map['categoryName'].toString();
      this._languageCurr = map['languageCurr'].toString();
      this._count=0;
    }catch(e){
      print("Error in Map Json Item  :" +e.toString());
    }

  }

  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');

  get languageCurr => _languageCurr;

  set languageCurr(value) {
    _languageCurr = value;
  }

  get categoryName => _categoryName;

  set categoryName(value) {
    _categoryName = value;
  }
  int get id => _id;

  set id(int value) {
    _id = value;
  }

String showPrice(){
 return numberFormat.format(_price);
}

  int get price => _price;

  set price(int value) {
    _price = value;
  }

  get photo => _photo;

  set photo(value) {
    _photo = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  get languageName => _languageName;

  set languageName(value) {
    _languageName = value;
  }

  int get categoryId => _categoryId;

  set categoryId(int value) {
    _categoryId = value;
  }

  int get languageId => _languageId;

  set languageId(int value) {
    _languageId = value;
  }

  int get count => _count;

  set count(int value) {
    _count = value;
  }

  void plus(){
    _count++;
  }
  void minus(){
   if(_count>0) _count--;
  }
}
