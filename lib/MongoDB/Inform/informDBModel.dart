import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';


informDbModel MongoDbModelFromJson(String str)=> informDbModel.fromJson(json.decode(str));
String mongoDbModelToJson(informDbModel data )=> json.encode(data.tojson());

class informDbModel {
  informDbModel({
    required this.id,
    required this.ID_Device,
    required this.Proble,
    required this.firstName,
    required this.lastName,
  required this.status,
  
  });
  ObjectId id;
    String ID_Device;
    String Proble;
    String firstName; 
    String lastName;
    String status;

  factory informDbModel.fromJson(Map<String,dynamic>json)=> informDbModel(
    id: json["_id"],
    ID_Device:json["ID_Device"],
    Proble:json["Proble"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    status: json["status"],
  );
  Map<String,dynamic>tojson()=>{
    "_id":id,
    "ID_Device":ID_Device,
    "Proble":Proble,
    "firstName":firstName,
    "lastName":lastName,
    "status":status,
   
  };

}
/*
1 ID_Device
2 Proble
3 firstName
4 lastName
5  status
*/ 

