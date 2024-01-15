import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class localStorage{

  final storage = new FlutterSecureStorage();
  bool login = false;

  writeSecureData(String key, String value) async{
    await storage.write(key: key, value: value);
    print('Local Stroage $value');
  }

  readSecureData(String key) async{
    String value = await storage.read(key: key) ?? 'No data found';
    //print the value
    print('Data read $value');
    return value;
  }

  deleteSecureData(String key) async{
    String value = await storage.read(key: key) ?? 'No data found';
    print('Logout $value');
    await storage.delete(key: key);
    value = await storage.read(key: key) ?? 'No data found';
    print('Data is clear $value');
  }

  // //function for return a string value
  // Future<String> getStringValuesSF(String key) async {
  //   String? stringValue = await storage.read(key: key);
  //   return stringValue!;
  // }
}