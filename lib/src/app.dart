import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/home/homePage.dart';
import 'package:flutter_application_1/src/nvgBar.dart';

class App extends StatefulWidget{
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Wu Store',
      debugShowCheckedModeBanner: false,      
      home: Scaffold(
        body: homePage(),
        bottomNavigationBar: nvgBar(),
      ),
    );
  }
}