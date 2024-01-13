import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/currentPage.dart';
import 'package:flutter_application_1/src/data/data.dart';
import 'package:flutter_application_1/src/home/homePage.dart';
import 'package:flutter_application_1/src/map/map.dart';
import 'package:flutter_application_1/src/nvgBar.dart';
import 'package:flutter_application_1/src/profile/profile.dart';
import 'package:provider/provider.dart';

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
      home: ChangeNotifierProvider<CurrentIndex>(
        create: (context) => CurrentIndex(),
        child: Scaffold(
          body: Consumer<CurrentIndex>(
          builder: (context, value, child) => IndexedStack(
          index: value.currentIndex,
          children: <Widget>[
            homePage(),
            DataList(),
            MapPage(),
            Profile(),
          ],
        ),
          ),
        bottomNavigationBar: nvgBar(),
        ),
      ),
    );
  }
}