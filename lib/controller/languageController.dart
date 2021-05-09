import 'package:flutter_menu_app/models/api/languageApi.dart';
import 'package:flutter_menu_app/models/language/languageData.dart';

class LanguageController{
  Future <List<Language>> getLanguages () async{
    List<Language> data=[];
  var result =await LanguageApi().getLanguages();
    if(result==401){
      print('Non Authentication');
    }
    else{
      for(var item in result){
        data.add(Language.fromJson(item));
      }
    }
    return data;

 }
}