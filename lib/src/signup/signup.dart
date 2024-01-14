import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/signup/signupForm.dart';
import 'package:flutter_application_1/src/logo.dart';

class signupPage extends StatefulWidget{
  @override
  _signupPageState createState() => _signupPageState();
}

class _signupPageState extends State<signupPage>{
  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);//for status bar icon color

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Logo(),
              signupForm(),
            ],
          ),
        ),
      ),
    );
  }
}