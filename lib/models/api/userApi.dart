import 'dart:convert';

import 'package:flutter_menu_app/Utilities/utilities.dart';
import 'package:flutter_menu_app/models/user/loginDTO.dart';
import 'package:flutter_menu_app/models/user/loginResponse.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class userApi {

  Future getUser() async {
    SharedPreferences _perf=await SharedPreferences.getInstance();
    
    String _accessToken = _perf.getString('access_token');
    if(_accessToken==null) return null;
    Uri url = Uri.parse(Utilites.GetUsers);
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
      default:
        throw Exception('Server not respond State [' +
            response.statusCode.toString() +
            ']! ' +
            response.body);
        break;
    }
  }

  // ignore: missing_return
  Future<LoginResponse> login(LoginDTO loginDTO) async {
    String _path = Utilites.LoginUrl +
        '?email=' +
        loginDTO.email +
        '&&password=' +
        loginDTO.password;
    Uri url = Uri.parse(_path);
    Map<String, String> header = {'Accept': 'application/json'};
    http.Response _response = await http.get(url, headers: header);
    if (_response.statusCode == 200) {
      var result = jsonDecode(_response.body);
      return LoginResponse(
          result['ID'], result['Name'], result['access_token']);
    } else if (_response.statusCode == 401) {
      return null;
    }
  }

  // ignore: missing_return
  Future<bool> logout() async {
    SharedPreferences _perf=await SharedPreferences.getInstance();
    try{
      _perf.remove('access_token');
      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
  }
}
