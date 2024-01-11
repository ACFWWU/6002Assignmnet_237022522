import 'package:flutter/material.dart';

class homePage extends StatefulWidget{
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      //   //show the tittle in  middle of appbar
      //   centerTitle: true,
      //   backgroundColor: Colors.blueGrey,
      //   foregroundColor: Colors.white,
        title: Text('Wu Store'),
      ),
    );
  }
}