import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/login/models/loginModel.dart';

class LoginForm extends StatefulWidget{
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
  final _formKey = GlobalKey<FormState>(); //for validation
  loginModel formData = loginModel();

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey, //for validation
      child: Column(
        children:<Widget>[
          TextFormField( //for username
            decoration: InputDecoration(
              labelText: "Username",
              hintText: "Enter your username",
              helperText: '',
        ),
      ),
          TextFormField( //for password
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              helperText: '',
        ),
        obscureText: true,
      ),
      Container( //for login button
        padding: EdgeInsets.only(
          top: 20.0,
        ),
        width: double.infinity,
        child: ElevatedButton(
          child: Text('Login',
                 style: TextStyle(
                  color: Colors.white60,
                 ), 
          ),
          onPressed: (){},
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