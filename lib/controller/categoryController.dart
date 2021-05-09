import 'package:flutter_menu_app/models/api/categoryApi.dart';
 import 'package:flutter_menu_app/models/category/category.dart';

class CategoryController{
  Future <List<Category>> getCategoryByLanguageID(ID)  async{
    List<Category> data=[];
    var result =await CategoryApi().getCategoryByLanguageID(ID);
    for(var item in result){
      data.add(Category.fromJson(item));
    }
    return data;
  }
}