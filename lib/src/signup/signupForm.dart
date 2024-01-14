import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/db/constant.dart';
import 'package:flutter_application_1/src/db/mongoDB.dart';
import 'package:flutter_application_1/src/signup/models/signupModel.dart';
import 'package:flutter_application_1/src/signup/provider/signupService.dart';
import 'package:flutter_application_1/src/signup/provider/signupService.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/src/login/login.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:provider/provider.dart';


class signupForm extends StatefulWidget{
  @override
  _signupFormState createState() => _signupFormState();
}

class _signupFormState extends State<signupForm>{
  final _formKey = GlobalKey<FormState>(); //for validation
  signupModel formData = signupModel();
  //bool validateTextField = false;
  signupService _signupService = signupService();

  Future<void> submitForm() async {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print('Name: ${formData.name}');
      print('Password: ${formData.password}');
      bool nameExisted = await _signupService.checkInput(formData);

      if(nameExisted == false){
      _signupService.singup(formData);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Welcome ${formData.name} your account is create'),),);
    }else if(nameExisted==true){
      //show the snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This user already exists'),),);
    }
    }
  }

  void _goToLoginPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => loginPage()),
  );
}

  String validateUserName(String? value){    
    if(value!.isEmpty){
      return 'Please enter your username';
    }
    return '';
  }

  String validatePassword(String? value){
    if(value!.isEmpty){
      return 'Please enter your password';
    }
    return '';
  }

  @override
  Widget build(BuildContext context){
    _signupService = Provider.of<signupService>(context);

    return Form(
      key: _formKey, //for validation
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children:<Widget>[
          TextFormField( //for username
            decoration: InputDecoration(
              labelText: "Username",
              hintText: "Enter your username",
              helperText: '',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your username';
          }
          return null;
        
        },//validate the username
        onSaved: (value){ //save the value to the model for signup
          formData.name = value!;
        },
         //validator: validateTextField, //validate the username
          
      ),
          TextFormField( //for password
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              helperText: '',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },//validate the password
        onSaved: (value){ //save the value to the model for signup
          formData.password = value!;
        },
         
        //obscureText: true,
      ),
      Container( //for signup button
        padding: EdgeInsets.only(
          top: 20.0,
        ),
        width: double.infinity,
        child: ElevatedButton(
          child: Text('Create Account',
                 style: TextStyle(
                  color: Colors.white60,
                 ), 
          ),
          onPressed: submitForm,
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(15.0),
            elevation: 5.0,
          ),
        ),
      ),
      Container( //for sign buttom
        width: double.infinity,
        child: TextButton(
          child: Text('Already have an account? Login',
                 style: TextStyle(
                  color: Colors.black87,
                 ), 
          ),
          onPressed: (){
            _goToLoginPage(context);
          },
          //set the button color be purple
          style: TextButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.all(15.0),
            elevation: 5.0,
          ),
        ),
      ),
        ],
      ),
    );
  }
}