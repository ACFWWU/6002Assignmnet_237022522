// Create a ChangeNotifier class to hold the user login state
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
   bool _isLoggedIn =true ;
   bool a = true ;
  

  void login() {
    // Perform your login logic here
    _isLoggedIn = true;
    a= true;
    notifyListeners();
  }

  void logout() {
    // Perform your logout logic here
    _isLoggedIn = false;
    a= false;
    notifyListeners();
  }

  bool get isLoggedIn => _isLoggedIn;
  bool get isA => a;
}
