import 'dart:convert';

import 'package:flutter_menu_app/models/api/utilitiesApi.dart';
import 'package:flutter_menu_app/models/user/RegisterDTO.dart';
import 'package:flutter_menu_app/models/user/loginDTO.dart';
import 'package:flutter_menu_app/models/user/loginResponse.dart';
import 'package:flutter_menu_app/utilities/utilities.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class UserApi {
  Future getUser() async {
    String _accessToken = await Utilities.getAccessToken();
    if (_accessToken == null) return '403';
    Uri url = Uri.parse(UtilitiesApi.GetUsers);
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
    String _path = UtilitiesApi.LoginUrl +
        '?email=' +
        loginDTO.email +
        '&password=' +
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
  Future<LoginResponse> register(RegisterDTO registerDTO) async {
    String _path = UtilitiesApi.RegisterUrl +
        '?name=' +
        registerDTO.name +
        '?email=' +
        registerDTO.email +
        '&password=' +
        registerDTO.password;
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
    return Utilities.removeKey('access_token');
  }
}
