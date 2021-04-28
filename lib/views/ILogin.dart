import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/controller/userController.dart';
import 'package:flutter_menu_app/models/user/loginDTO.dart';
import 'package:flutter_menu_app/views/IUser.dart';
import 'package:flutter_menu_app/views/utilites/DrawerPage.dart';

class ILogin extends StatefulWidget {
  @override
  _ILoginState createState() => _ILoginState();
}

class _ILoginState extends State<ILogin> {
  var _form = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  UserController _userController = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Page(),
      drawer: Drawer(
        child: DrawerPage() ,
      ),
    );
  }
Widget Page(){
    return  SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          color: Color.fromRGBO(230, 230, 230, 1),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[welcomeText(), specar(10),email(), specar(10), password(), specar(40), submitButton()],
            ),
          ),
        ));
}
Widget welcomeText(){
return ListTile(
  title: Text("Login",style: TextStyle(color: Colors.black87,fontSize: 26),),
contentPadding: EdgeInsets.all(20),
  subtitle: Text("Please enter your Information :",style: TextStyle(color: Colors.black87,fontSize: 18),),
);
}
  Widget email() {
    return TextFormField(
      controller: _email,
      decoration: InputDecoration(hintText: 'Enter Your Email'),
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
    );
  }

  Widget password() {
    return TextFormField(
      controller: _password,
      obscureText: true,
      decoration: InputDecoration(hintText: "Password"),
      validator: (pass) {
        if (pass.isEmpty) {
          return 'enter password';
        } else if (pass.length < 3) {
          return 'Must a password more then 3 chars';
        }
      },
    );
  }

  Widget specar(double size) {
    return SizedBox(
      height: size,
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.deepOrange) ,
        padding:MaterialStateProperty.all( EdgeInsets.only(bottom: 15,top: 15,right: 50 , left: 50))
      ),
      child: Text(
        'Login',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      ),
      onPressed: () async {
      if(_form.currentState.validate()){
        var result=_userController.login(
           LoginDTO(_email.text, _password.text)
        );
        Navigator.of(context).push(
            MaterialPageRoute(builder:(context) =>IUser())
        );
      }
      },
    );
  }
}
