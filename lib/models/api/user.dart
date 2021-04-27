import 'dart:convert';

import 'package:http/http.dart' as http;


class UserApi{
  Future  getUser() async{
    String accessToken= '1|PlIMZ7M8BIr2VeWMdpgM4J6h7rAyUpKN4lUVtd2a';
    var url = Uri.parse('http://192.168.0.101/MenuApp/public/api/getUsers');

    Map<String, String>  header= {
      'Accept' : 'application/json' ,
      'Authorization' : 'Bearer ' +accessToken
    };

    http.Response response =await http.get(url,headers: header);

    switch(response.statusCode){
      case 200:
      case 201:
        //print(" Repo : ============ "+response.body);
        var data= jsonDecode(response.body);  //print(data );
        return data ;
        break;
      default:
        throw Exception('Server not respond State ['+response.statusCode.toString()+']! ' + response.body);
        break;
    }
  }
}