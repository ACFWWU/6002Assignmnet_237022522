import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/login/models/loginModel.dart';

class LoginForm extends StatefulWidget{
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
  final _formKey = GlobalKey<FormState>(); //for validation
  loginModel formData = loginModel();
  bool validateTextField = false;

  void submitForm(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print('Name: ${formData.name}');
      print('Password: ${formData.password}');
    } else {
      setState(() {
        validateTextField = true;
      });
    }
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
        onSaved: (value){ //save the value to the model for login
          formData.name = value!;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validateUserName, //validate the username
      ),
          TextFormField( //for password
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              helperText: '',
        ),
        onSaved: (value){ //save the value to the model for login
          formData.password = value!;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validatePassword, //validate the password
        obscureText: true,
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
          onPressed: (){},
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