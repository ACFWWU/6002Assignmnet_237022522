import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/auth/authProvider.dart';
import 'package:flutter_application_1/src/currentPage.dart';
import 'package:flutter_application_1/src/data/data.dart';
import 'package:flutter_application_1/src/home/homePage.dart';
import 'package:flutter_application_1/src/localStroage/localStroage.dart';
import 'package:flutter_application_1/src/login/login.dart';
import 'package:flutter_application_1/src/login/provider/loginService.dart';
import 'package:flutter_application_1/src/map/current_location_screen.dart';
import 'package:flutter_application_1/src/map/map.dart';
import 'package:flutter_application_1/src/nvgBar.dart';
import 'package:flutter_application_1/src/profile/profile.dart';
import 'package:flutter_application_1/src/signup/signup.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget{
  @override
  _AppState createState() => _AppState();
}

// class _AppState extends State<App>{
//   Future<String?> getData() async{
//   String? value = await  FlutterSecureStorage().read(key: 'name');
//   // Use the 'value' string here
//   return value;
// }
  
//   @override
//   Widget build(BuildContext context){
    
//     return MaterialApp(
//      home: 
//      FutureBuilder<String?>(
//               future: getData(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return loginPage();
//                 } else {
//                   return MaterialApp(
//       title: 'Wu Store',
//       debugShowCheckedModeBanner: false,      
//       home: ChangeNotifierProvider<CurrentIndex>(
//         create: (context) => CurrentIndex(),
//         child: Scaffold(
//           body: Consumer<CurrentIndex>(
//           builder: (context, value, child) => IndexedStack(
//           index: value.currentIndex,
//           children: <Widget>[
//             homePage(),
//             DataList(),
//             //locationPage(),
//             MapPage(),
//             Profile(),
//           ],
//         ),
//           ),
//         bottomNavigationBar: nvgBar(),
//         ),
//       ),
//     );
//                 }
//               },
//             ),
//     );
//   }
// }


class _AppState extends State<App>{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      // ...
      home: 
      Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          if (AuthProvider().isLoggedIn == false) {
            // User is logged in, show authenticated content
            print(AuthProvider().isLoggedIn);
            return loginPage();
          } else {
            // User is not logged in, show login screen
            print(AuthProvider().isLoggedIn);
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
            //locationPage(),
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
        },
      ),
    );
  }


// //***** */  
//   // @override
//   // Widget build(BuildContext context){
//   //   return MaterialApp(
//   //     title: 'Wu Store',
//   //     debugShowCheckedModeBanner: false,      
//   //     home: ChangeNotifierProvider<CurrentIndex>(
//   //       create: (context) => CurrentIndex(),
//   //       child: Scaffold(
//   //         body: Consumer<CurrentIndex>(
//   //         builder: (context, value, child) => IndexedStack(
//   //         index: value.currentIndex,
//   //         children: <Widget>[
//   //           homePage(),
//   //           DataList(),
//   //           MapPage(),
//   //           Profile(),
//   //         ],
//   //       ),
//   //         ),
//   //       bottomNavigationBar: nvgBar(),
//   //       ),
//   //     ),
//   //   );}
  }
