import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';


DeviceDbModel DeviceDbModelFromJson(String str)=> DeviceDbModel.fromJson(json.decode(str));
String DeviceDbModelToJson(DeviceDbModel data )=> json.encode(data.tojson());

class DeviceDbModel {
  DeviceDbModel({
    required this.id,
    required this.ID_Device,
    required this.inventory,
    required this.type,
    required this.price,
    required this.year,
    required this.brand,
    required this.model,
    required this.ID_Desk,
    required this.quality,

 
  });
  ObjectId id;
   String ID_Device;
    String inventory;
    String type;
    String price; 
    String year;
    String brand;
    String model;
    String ID_Desk;
    String quality;

  factory DeviceDbModel.fromJson(Map<String,dynamic>json)=> DeviceDbModel(
    id: json["_id"],
    ID_Device:json["ID_Device"],
    inventory:json["inventory"],
    type:json["type"],
    price: json["price"],
    year: json["year"],
    brand:json["brand"],
    model:json["model"],
    ID_Desk:json["ID_Desk"],
    quality:json["quality"],
 
  );
  Map<String,dynamic>tojson()=>{
    "_id":id,
    "ID_Device":ID_Device,
    "inventory":inventory,
    "type":type,
    "price":price,
    "year":year,
    "brand":brand,
    "model":model,
    "ID_Desk":ID_Desk,
    "quality":quality,
  };

}
/*
ID_Device
inventory numder
type
price
year of use
brand
model
ID_Desk 
quality
*/ 

