import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/currentPage.dart';
import 'package:provider/provider.dart';

class nvgBar extends StatelessWidget{
//   @override
//   _nvgBarState createState() => _nvgBarState();
// }

// class _nvgBarState extends State<nvgBar>{
//   //int _currentIndex = 0;

  @override
  Widget build(BuildContext context){
      final currentIndex = Provider.of<CurrentIndex>(context);

      return BottomNavigationBar(
        currentIndex: currentIndex.currentIndex,
        onTap: (value){
          currentIndex.currentIndex = value;
        },
        //setting for bottom showing
        showSelectedLabels: true,
        showUnselectedLabels: true,
        //nvgbar item setting
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined),
            label: 'Food',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blueGrey,
          ),
          
        ],
        // //set for user selected item
        // currentIndex: _currentIndex,
        // selectedItemColor: Colors.amber[800],
        // //set for user tap item
        // onTap: (index){
        //   setState(() {
        //      _currentIndex = index;
        //   });
        // },
      );
  }
}