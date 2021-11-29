import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/authservice.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  @override 
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State <LoginScreen> {
var name, password, token;

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
            onChanged: (val) {
              name = val;
            },
          ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (val) {
              password = val;
            },
          ),
            SizedBox(height: 10.0),
            RaisedButton(
            child: Text('Autenticar'),
            color: Colors.blue,
            onPressed: (){
            AuthService().login(name,password).then((val){
                if(val.data['success']){
                  token = val.data['token'];
                  Fluttertoast.showToast(
                    msg: 'Autenticado',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }
              });
            },
          )
        ],

      )
    );
  }
}