import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';


UserDbModel MongoDbModelFromJson(String str)=> UserDbModel.fromJson(json.decode(str));
String mongoDbModelToJson(UserDbModel data )=> json.encode(data.tojson());

class UserDbModel {
  UserDbModel({
    required this.id,
    required this.ID_User,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.Phone,
    required this.image,
    required this.seat,
   
  });
  ObjectId id;
    String ID_User;
    String password;
    String firstName; 
    String lastName;
    String age;
    String Phone;
    String image;
    String seat;

  factory UserDbModel.fromJson(Map<String,dynamic>json)=> UserDbModel(
    id: json["_id"],
    ID_User:json["ID_User"],
    password:json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    age:json["age"],
    Phone:json["Phone"],
    image:json["image"],
    seat:json["seat"],
  );
  Map<String,dynamic>tojson()=>{
    "_id":id,
    "ID_User":ID_User,
    "password":password,
    "firstName":firstName,
    "lastName":lastName,
    "age":age,
    "Phone":Phone,
    "image":image,
    "seat":seat,
  };
}
/*
1 id
2 ID_User
3 password
4 firstName
5 lastName
6 age
7 Phone
8 image
9 seat

*/ 

