import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class localStorage{

  final storage = new FlutterSecureStorage();
  bool login = false;
  String name = '';

  //make getter of get name 
  String get getUserName => name;
  

 void writeSecureData(String key, String value) async{
    await storage.write(key: key, value: value);
    print('Local Stroage $value');
    name = value;
  }

 void readSecureData(String key) async{
    String value = await storage.read(key: key) ?? 'No data found';
    //print the value
    print('Data read $value');
    name = value;
  }

  void deleteSecureData(String key) async{
    String value = await storage.read(key: key) ?? 'No data found';
    print('Logout $value');
    await storage.delete(key: key);
    value = await storage.read(key: key) ?? 'No data found';
    print('Data is clear $value');
    name='';
  }

}