import 'dart:convert';
import 'package:flutter_menu_app/models/api/utilitiesApi.dart';
import 'package:flutter_menu_app/utilities/utilities.dart';
import 'package:http/http.dart' as http;

class LanguageApi {
  Future getLanguages() async {
    String _accessToken = await Utilities.getAccessToken();
    if (_accessToken == null) return '403';
    Uri url = Uri.parse(UtilitiesApi.GetLanguages);
    Map<String, String> header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + _accessToken
    };
    http.Response response = await http.get(url, headers: header);
    switch (response.statusCode) {
      case 200:
      case 201:
        var data = jsonDecode(response.body);
        return data;
        break;
      case 401:
        return 401;
        break;
      default:
        throw Exception('Server not respond State [' +
            response.statusCode.toString() +
            ']! ' +
            response.body);
        break;
    }
  }
}
