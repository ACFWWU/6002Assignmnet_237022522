// Create a ChangeNotifier class to hold the user login state
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    // Perform your login logic here
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    // Perform your logout logic here
    _isLoggedIn = false;
    notifyListeners();
  }
}
