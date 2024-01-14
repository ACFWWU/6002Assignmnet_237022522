import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/db/constant.dart';
import 'package:flutter_application_1/src/signup/models/signupModel.dart';
import 'package:http/http.dart' as http;

class signupForm extends StatefulWidget{
  @override
  _signupFormState createState() => _signupFormState();
}

class _signupFormState extends State<signupForm>{
  final _formKey = GlobalKey<FormState>(); //for validation
  signupModel formData = signupModel();
  //bool validateTextField = false;

  void singup() async{
    var  regBody = {
      'name': formData.name,
      'password': formData.password,
    };

    var response = await http.post(Uri.parse(MONGO_DB_URL),
    headers: {'Content-Type': 'application/json'},
    body: regBody);

    print(response);
  } 

  void submitForm(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print('Name: ${formData.name}');
      print('Password: ${formData.password}');

      singup();
      
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
            decoration: InputDecoration(
              labelText: "Username",
              hintText: "Enter your username",
              helperText: '',
        ),
        onSaved: (value){ //save the value to the model for signup
          formData.name = value!;
        },
        validator: validateUserName, //validate the username
      ),
          TextFormField( //for password
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              helperText: '',
        ),
        onSaved: (value){ //save the value to the model for signup
          formData.password = value!;
        },
        validator: validatePassword, //validate the password
        obscureText: true,
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