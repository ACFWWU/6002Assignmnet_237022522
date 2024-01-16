import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/app.dart';
import 'package:flutter_application_1/src/auth/authProvider.dart';
import 'package:flutter_application_1/src/localStroage/localStroage.dart';
import 'package:flutter_application_1/src/login/models/loginModel.dart';
import 'package:flutter_application_1/src/login/provider/loginService.dart';
import 'package:flutter_application_1/src/signup/signup.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget{
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
  final _formKey = GlobalKey<FormState>(); //for validation
  loginModel formData = loginModel();
  //bool validateTextField = false;
  loginService _loginService = loginService();
  AuthProvider authProvider = AuthProvider();
  
  Future<void> submitForm() async {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print('Name: ${formData.name}');
      print('Password: ${formData.password}');
      bool nameExisted = await _loginService.login(formData);

      if(nameExisted == true){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Welcome ${formData.name} '),),);
        localStorage().writeSecureData('name',formData.name);
      print('is true');
      
      _goToMainPage(context);
      authProvider.login();
      }else if(nameExisted==false){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This username or password wrong'),),);
      print('is false');
      
    }
    // } else {
    //   setState(() {
    //     validateTextField = true;
    //   });
    // }
  }
  }

  void _goToMainPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => App()),
  );}

  void _goToSignupPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => signupPage()),
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

    return Form(
      key: _formKey, //for validation
      child: Column(
        children:<Widget>[
          TextFormField( //for username
            decoration: const InputDecoration(
              labelText: "Username",
              hintText: "Enter your username",
              helperText: '',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your username';
          }
          return null;
        
        },onSaved: (value){ //save the value to the model for login
          formData.name = value!;
        },
      ),
          TextFormField( //for password
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              helperText: '',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
        onSaved: (value){ //save the value to the model for login
          formData.password = value!;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
      Container( //for login button
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        width: double.infinity,
        child: ElevatedButton(
          child: Text('Login',
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
          child: Text('Sign Up',
                 style: TextStyle(
                  color: Colors.black87,
                 ), 
          ),
          //when presse the button go to the signup page
          onPressed: (){_goToSignupPage(context);},
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