import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/login/login.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      //show login page
      body: loginPage(),


      // appBar: AppBar(
      //   //show the tittle in  middle of appbar
      //   centerTitle: true,
      //   backgroundColor: Colors.blueGrey,
      //   foregroundColor: Colors.white,
      //   title: Text('Profile'),
      //   elevation: 0.0,
      // ),
    );
  }
} 