import 'dart:developer';
import 'package:flutter_application_1/src/db/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDB {
  static connect()async{
    var database = await Db.create(MONGO_DB_URL);
    await database.open();
    inspect(database);
    var collection = database.collection(MONGO_DB_NAME);

    var status = database.serverStatus();
    print(await collection.find().toList());
  }
}