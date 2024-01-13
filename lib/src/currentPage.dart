import 'package:flutter/foundation.dart';

class CurrentIndex with ChangeNotifier{
  int index = 0;
  int get currentIndex => index;
  
  set currentIndex(int value){
    index = value;
    notifyListeners();
  }
}