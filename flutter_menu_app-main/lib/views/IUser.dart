import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/controller/userController.dart';
import 'package:flutter_menu_app/models/user/userData.dart';
import 'package:flutter_menu_app/views/utilities/DrawerPage.dart';

class IUser extends StatefulWidget {
  @override
  _IUserState createState() => _IUserState();
}

class _IUserState extends State<IUser> {
  UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: contentWidget(context, _userController),
      drawer: Drawer(
        child: DrawerPage(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          contentWidget(context, _userController);
        }),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.red.shade200,
    );
  }
}

Widget contentWidget(BuildContext context, UserController _userController) {
  return FutureBuilder(
    future: _userController.getUsers(),
    builder: (BuildContext context, AsyncSnapshot<List<User>> snap) {
      // ignore: missing_return, missing_return
      switch (snap.connectionState) {
        case ConnectionState.active:
          return Container(
            child: Text('Active'),
          );
          // ignore: missing_return
          break;
        case ConnectionState.waiting:
          return Center(
            child: CircularProgressIndicator(),
          );
          break;
        case ConnectionState.done:
          print(snap.data);
          if (snap.hasError) {
            return Container(
              child: Text('Error in get Date : ' + snap.error.toString()),
            );
          } else if (snap.hasData) {
            // ignore: missing_return
            return Container(
                padding: EdgeInsets.all(20),
                child: Scrollbar(
                  hoverThickness: 200,
                  thickness: 20,
                  child: _drawUser(context, snap.data),
                )

                // ignore: missing_return, missing_return
                );
          }
          return Container();
        case ConnectionState.none:
          // TODO: Handle this case.
          break;
      }
    },
  );
}

Widget _drawUser(BuildContext context, List<User> users) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {},
              leading: Text(users[index].id.toString()),
              title: Text(users[index].name),
              subtitle: Text(users[index].email),
              trailing: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () async {},
              ),
            ),
          ),
        );
      });
}
