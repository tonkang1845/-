import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';


AddressDbModel DeviceDbModelFromJson(String str)=> AddressDbModel.fromJson(json.decode(str));
String AddressDbModelToJson(AddressDbModel data )=> json.encode(data.tojson());

class AddressDbModel {
  AddressDbModel({
    required this.id,
    required this.ID_desk,
    required this.picture_floor,
    required this.Picture_room,
    required this.floor,
    required this.room,

/*
ID_desk
picture_floor
Picture_room
floor
room
ID_Device
User
*/ 
 
  });
  ObjectId id;
    String ID_desk;
    String picture_floor;
    String Picture_room; 
    String floor;
    String room;


  factory AddressDbModel.fromJson(Map<String,dynamic>json)=> AddressDbModel(
    id: json["_id"],
    ID_desk:json["ID_desk"],
    picture_floor:json["picture_floor"],
    Picture_room: json["Picture_room"],
    floor: json["floor"],
    room:json["room"],

 
  );
  Map<String,dynamic>tojson()=>{
    "_id":id,
    "ID_desk":ID_desk,
    "picture_floor":picture_floor,
    "Picture_room":Picture_room,
    "floor":floor,
    "room":room,

  };

}


