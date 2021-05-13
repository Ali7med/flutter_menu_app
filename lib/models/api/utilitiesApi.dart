import 'package:flutter_menu_app/utilities/utilities.dart';
import 'package:http/http.dart' as http;

class UtilitiesApi {
  static const String BaseUrl = "http://192.168.0.101/MenuApp/public/api";
  static const String LoginUrl = BaseUrl + "/login";
  static const String RegisterUrl = BaseUrl + "/register";
  static const String GetUsers = BaseUrl + "/getUsers";
  static const String GetLanguages = BaseUrl + "/get_all_lang";
  static const String GetCategoryByLanguage = BaseUrl + "/getCatsByLang/";
  static const String GetItemByLanguageCategory = BaseUrl + "/getItemByLang_Cat/";


  static Future<http.Response> makeRequest({String path, String bearer = ''}) async {
    Uri url = Uri.parse(path);
    Map<String, String> header = {'Accept': 'application/json'};
    if (bearer != '') {
      String _accessToken = await Utilities.getAccessToken();
      header['Authorization'] = 'Bearer ' + bearer;
    }
    http.Response _response = await http.get(url, headers: header);
    return _response;
  }
}
