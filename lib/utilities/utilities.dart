import 'package:shared_preferences/shared_preferences.dart';

class Utilities{
static const String Access_token="access_token";
static const String Access_Name="user_name";
static const String Access_ID="user_id";



static Future<String> getAccessToken() async {
  SharedPreferences _perf=await SharedPreferences.getInstance();
  String _accessToken = _perf.getString(Utilities.Access_token);
  return _accessToken;
}
static Future<String> getUserName() async {
  SharedPreferences _perf=await SharedPreferences.getInstance();
  String _accessToken = _perf.getString(Utilities.Access_Name);
  return _accessToken;
}
static Future<String> getUserID() async {
  SharedPreferences _perf=await SharedPreferences.getInstance();
  String _accessToken = _perf.getString(Utilities.Access_ID);
  return _accessToken;
}

static Future<bool> storeKey(key,value) async{
  SharedPreferences _pref = await SharedPreferences.getInstance();
 return _pref.setString(key, value);
}
static Future<bool> removeKey(key) async {
  SharedPreferences _perf=await SharedPreferences.getInstance();
  try{
    _perf.remove(key);
    return true;
  }catch(e){
    print(e.toString());
  }
  return false;
}



}