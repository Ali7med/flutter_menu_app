import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_menu_app/controller/userController.dart';
import 'package:flutter_menu_app/models/user/loginDTO.dart';
import 'package:flutter_menu_app/models/user/loginResponse.dart';
import 'package:flutter_menu_app/views/IHome.dart';
import 'package:flutter_menu_app/views/IRegister.dart';
import 'package:flutter_menu_app/views/utilities/DrawerPage.dart';

class ILogin extends StatefulWidget {
  @override
  _ILoginState createState() => _ILoginState();
}

class _ILoginState extends State<ILogin> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  UserController _userController = UserController();

  ValueNotifier _isLoading = ValueNotifier(false);
  ValueNotifier _messageError = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Page(),
      drawer: Drawer(
        child: DrawerPage(),
      ),
    );
  }


  Widget Page() {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(40),
      color: Color.fromRGBO(230, 230, 230, 1),
      child: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            welcomeText(),
            email(),
            specar(10),
            password(),
            specar(40),
            showLoading(context),
            showMessageError(context),
            specar(40),
            submitButton(),
            showRegister(),
          ],
        ),
      ),
    ));
  }

  Widget welcomeText() {
    return ListTile(
      title: Text(
        "Login",
        style: TextStyle(color: Colors.black87, fontSize: 26),
      ),
      contentPadding: EdgeInsets.all(20),
      subtitle: Text(
        "Please enter your Information :",
        style: TextStyle(color: Colors.black87, fontSize: 18),
      ),
    );
  }

  Widget email() {
    return TextFormField(
      controller: _email..text='ali@ali.com',
      decoration: InputDecoration(labelText: 'Enter Your Email'),
      validator: (email) {
        // ignore: missing_return
        if (email.isEmpty) {
          return "Must to enter Email";
        }
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@'
            r'((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        return (!regex.hasMatch(email)) ? 'Please enter valid email !' : null;
      },
    );
  }

  Widget password() {
    return TextFormField(
      controller: _password..text='password',
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

  Widget showLoading(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _isLoading,
        builder: (context, _isLoading, child) {
          if (_isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        });
  }

  Widget showMessageError(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _messageError,
        builder: (context, _messsage, child) {
          if (_messageError == '') {
            return Container();
          } else {
            return Center(
              child: Text(
                _messageError.value,
                style: TextStyle(color: Colors.red),
              ),
            );
          }
        });
  }

  Widget specar(double size) {
    return SizedBox(
      height: size,
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
          padding: MaterialStateProperty.all(
              EdgeInsets.only(bottom: 15, top: 15, right: 50, left: 50))),
      child: Text(
        'Login',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      ),
      onPressed: () async {
        if (_form.currentState.validate()){
          _isLoading.value = true;
          _messageError.value = '';
          try {
            LoginResponse result = await _userController
                .login(LoginDTO(_email.text, _password.text));
            if (result != null) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => IHome()));
            } else {
              _messageError.value = 'Please Enter Correct Email or Password';
            }
          } catch (e) {
            print("Error :::" + e.toString());
          }
          _isLoading.value = false;
        }
      },
    );
  }

  Widget showRegister() {
    return FlatButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => IRegister()));
        },
        child: Center(
          child: Row(
            children: <Widget>[
              Text('Create New Account '),
              Text(
                'REGISTER',
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ));
  }
}
