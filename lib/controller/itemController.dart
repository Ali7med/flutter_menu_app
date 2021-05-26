import 'package:flutter_menu_app/models/api/itemApi.dart';
import 'package:flutter_menu_app/models/item/ItemData.dart';

class ItemController{
  Future <List<Item>> getItemByLanguageCategoryID ({String lanID,String catID})  async{
    List<Item> data=[];
    var result =await ItemApi().getItemByLanguageCategoryID(lanID: lanID , catID: catID); print(result);
    if(result==401){
      print('Non Authentication Item API');
    }
    else{
      for(var item in result){
        data.add(Item.fromJson(item));
      }
    }
    return data;

  }
}
