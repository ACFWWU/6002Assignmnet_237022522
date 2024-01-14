import 'package:flutter_application_1/src/signup/models/signupModel.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:flutter_application_1/src/db/constant.dart';

class signupService{
  singup(signupModel data) async{
    var database = await mongo.Db.create(MONGO_DB_URL);
    await database.open();
    var collection = database.collection(MONGO_DB_NAME);
    await collection.insert({
      'name': data.name,
      'password': data.password,
    });
    print(await collection.find().toList());
    
  } 
}