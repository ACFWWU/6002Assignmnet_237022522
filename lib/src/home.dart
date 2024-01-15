import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/currentPage.dart';
import 'package:flutter_application_1/src/data/data.dart';
import 'package:flutter_application_1/src/home/homePage.dart';
import 'package:flutter_application_1/src/map/current_location_screen.dart';
import 'package:flutter_application_1/src/map/map.dart';
import 'package:flutter_application_1/src/nvgBar.dart';
import 'package:flutter_application_1/src/profile/profile.dart';
import 'package:provider/provider.dart';
class home extends StatefulWidget{
  @override
  _home createState() => _home();
}
class _home extends State<home>{
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
            //MapPage(),
            SearchPartnersView(),
            Profile(),
          ],
        ),
          ),
        bottomNavigationBar: nvgBar(),
        ),
      ),
    );}
}