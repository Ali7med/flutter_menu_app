import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/models/database/mysql.dart';
import 'package:mysql1/mysql1.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
              ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>
          [
            Row(
              children: <Widget>[
                Column(
                  children: <Widget> [
                    IconButton(
                        icon: Icon(Icons.get_app),
                        onPressed: (){
                            getDate();
                        }
                        ),
                    Text('Show Product')
                  ],
                )
              ],
            ),
            FutureBuilder(
              future: getDate(page:100),
              builder: (BuildContext context, AsyncSnapshot <List<User1>> snapshot){
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Text('Error Get Data'),
                  );
                  break;
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Center(
                      child: Text('Error!!!'),
                    );
                  if (!snapshot.hasData)
                    return Center(
                      child: Text('No Data'),
                    );//return _drawUser(context, snapshot.data);
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,

                      child: Column(
                        children: [
                          //.......
                          ListWidget(),
                        ],
                      )
                  );
                  break;
                default:
                  return Center(
                    child: Text('Error'),
                  );
                  break;
              }

              },
            )
          ], 
        ),
      ),
    );
  }



}
class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Contact $index'),
          );
        },
      ),
    );
  }
}
Widget _drawUser(BuildContext context, List<User1> users) {
  return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int position) {
        return Card( child: Container(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: ListTile(
            leading: Text(users[position].id.toString()),
            title: Text(users[position].name),
            subtitle: Text(users[position].email),
            trailing: IconButton(
              icon:Icon(Icons.favorite_border) ,
              onPressed: ()  async {
              },
            ),
          ),
        ),
        );
      });
}


Future<List<User1>> getDate({page}) async{
  List<User1> users=[];
  UserController _userController = UserController(UserAPI());
  try{print(1);
     var data= _userController.getUsers(page : page) ;
     return data;
  }catch(ex){
    print('Error in Get Data : ' +ex.toString());
  }


}
class UserController{
  UserAPI userAPI;

  UserController(this.userAPI);


  Future <List<User1>> getUsers({int page}) async {
  List<User1> users= [];
  try{
    Results data;
    data=await this.userAPI.getUsers(page: 100); // print(data);
    if(!data.isEmpty){
      for (var item in data) {
        users.add(User1(item['id'],item['name'],item['email']));
      }
    }

    return users;
  }catch(e){
    print("Error getUsers in UserController : " + e.toString());
  }
}

}
class User1{
  int id;
  String name,email;

  User1(this.id, this.name, this.email);
    User1.fromJson(Map<String , dynamic> map){
    this.id=map['id'];
    this.name=map['name'];
    this.email=map['email'];
  }
}
class UserAPI {
  Future getUsers({int page=100}) async {
    var db = Mysql();

    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'localhost', port: 3306, user: 'root', db: 'menu_app'));
    try {
      List<User1> users= [];
      //Results result = await conn.query('select id from users  limit ?', [page]) ; //print(result.fields.);
      Results result = await conn.query('select id,name, email from users  limit ?', [page]) ;

      var  data =  result  ;//print(data);
      return result;
    } catch (e) {
      print('Error in getUsers UserAPI  : ' + e.toString());
    }
    conn.close();
  }


}