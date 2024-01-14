import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/src/login/models/loginModel.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:flutter_application_1/src/db/constant.dart';

class loginService{
  Future<void> login0(loginModel data) async{
    
  } 
  Future<bool> login(loginModel data)async{
    //correct part 
    var database = await mongo.Db.create(MONGO_DB_URL);
    await database.open();
    var collection = database.collection(MONGO_DB_NAME);
    mongo.DbCollection coll;
    coll = database.collection(MONGO_DB_NAME);
    var query = mongo.where;
    bool nameExisted = false;

    var nameExists = await coll.findOne(query.eq('name', data.name)) != null;
    var passwordExists = await coll.findOne(query.eq('password', data.password)) != null;

    if(nameExists && passwordExists){
      print('This user already exists');
      nameExisted = true;    
  }else{nameExisted = false;}  
  return nameExisted;
}


}