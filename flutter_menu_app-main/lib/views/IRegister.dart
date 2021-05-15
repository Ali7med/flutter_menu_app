import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/controller/userController.dart';
import 'package:flutter_menu_app/models/user/RegisterDTO.dart';
import 'package:flutter_menu_app/models/user/loginResponse.dart';
import 'package:flutter_menu_app/views/IHome.dart';
import 'package:flutter_menu_app/views/utilities/DrawerPage.dart';

class IRegister extends StatefulWidget {
  @override
  _IRegisterState createState() => _IRegisterState();
}

class _IRegisterState extends State<IRegister> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  UserController _userController = UserController();

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerPage(),
      ),
      body: Page(),
    );
  }

  Widget Page() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            welcomeMessage(),
            nameField(),
            emailField(),
            passwordField(),
            submitRegister()
          ],
        ),
      ),
    );
  }

  Widget welcomeMessage() {
    return ListTile(
      contentPadding: EdgeInsets.only(top: 20, right: 10, left: 0, bottom: 10),
      title: Text('New Account'),
      subtitle: Text('create new account in application'),
    );
  }

  Widget nameField() {
    return TextFormField(
      controller: _name,
      validator: (name) {
        if (name.length < 3) return 'Must to have more then 3 chars';
        if (name.length > 20) return 'Must to have less then 20 chars';
      },
      decoration: InputDecoration(labelText: 'Full Name'),
    );
  }

  Widget emailField() {
    return TextFormField(
        controller: _email,
        validator: (email) {
          // ignore: missing_return
          if (email.isEmpty) {
            return "Must to enter Email";
            // ignore: missing_return
          }
          Pattern pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regex = new RegExp(pattern);
          return (!regex.hasMatch(email)) ? 'Please enter valid email !' : null;
        },
        decoration: InputDecoration(labelText: 'Email'));
  }

  Widget passwordField() {
    return TextFormField(
      controller: _pass,
      validator: (pass) {
        if (pass.length < 3) return 'Must Password More Then 3 Chars';
        if (pass.length > 20) return 'Must Password Less Then 20 Chars';
      },
      decoration: InputDecoration(labelText: 'Password'),
    );
  }

  Widget submitRegister() {
    return ElevatedButton(
      child: Text('Register'),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange)),
      onPressed: () async {
        if (_form.currentState.validate()) {
          //var result= await _userController.
          LoginResponse registerResponse = await _userController
              .register(RegisterDTO(_name.text, _email.text, _pass.text));
          if (registerResponse != null) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => IHome()));
          }
        }
        //call Controller to Send Data to create new account
      },
    );
  }
}
