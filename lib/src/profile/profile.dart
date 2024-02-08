import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/auth/authProvider.dart';
import 'package:flutter_application_1/src/localStroage/localStroage.dart';
import 'package:flutter_application_1/src/login/login.dart';
import 'package:flutter_application_1/src/login/provider/loginService.dart';
import 'package:flutter_application_1/src/signup/signup.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{

  
Future<String?> getData() async{
  String? value = await  FlutterSecureStorage().read(key: 'name');
  // Use the 'value' string here
  return value;
}

   @override
  void initState(){
    super.initState();
    _checkLogin();
  }
  _checkLogin() async{
    //await localStorage().readSecureData('name');
    if(AuthProvider().isLoggedIn == false){
    setState(() {builder: (context) => loginPage();});}
  }

   
  @override
  Widget build(BuildContext context){
    return Scaffold(
      //if the user login show the user name and logout button
      //if the user not login show the login and signup button
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        elevation: 0.0,
      ),  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<String?>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('Welcome ${snapshot.data}');
                } else {
                  return Text('Loading...');
                }
              },
            ),
            //Text('Welcome ${localStorage().readSecureData('name')}'),
            ElevatedButton(
              onPressed: () {
                localStorage().deleteSecureData('name');
                AuthProvider().logout();
                _goToLoginPage(context);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),

      //show login page
      //body: loginPage(),
      //body: signupPage(),

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
  void _goToLoginPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => loginPage()),
  );
}
} 