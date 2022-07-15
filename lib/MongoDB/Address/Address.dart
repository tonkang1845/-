import 'dart:developer';


import 'package:flutter_application/MongoDB/Address/AddressDBModel.dart';
import 'package:flutter_application/MongoDB/constant.dart';

import 'package:mongo_dart/mongo_dart.dart';

class AddressDatabase {
  static var Addressdb, Addresscollection;
  static connect() async {
    Addressdb = await Db.create(MONGO_CONN_URL);
    await Addressdb.open();
    inspect(Addressdb);
    Addresscollection = Addressdb.collection(ADDRESS_COLLECTION);
  }

  ////////////list users/////////////
  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await Addresscollection.find().toList();
    return arrData;
  }

///////////Update User///////////
  static Future<void> update(AddressDbModel data) async {
    var result = await Addresscollection.findOne({"_id": data.id});
    result['ID_Seat'] = data.ID_desk;
    result['Picture_floor'] = data.picture_floor;
    result['Picture_room'] = data.Picture_room;
    result['floor'] = data.floor;
    result['room'] = data.room;


    var response = await Addresscollection.save(result);
    inspect(response);
  }
/*
ID_desk
picture_floor
Picture_room
floor
room
ID_Device
User
*/ 
///////////delete////////////
  static delete(AddressDbModel user) async {
    await Addresscollection.remove(where.id(user.id));
  }

  //////////////Query //////////

///////////////////////////////////////////////////////
  static Future<String>insert(AddressDbModel data) async {
    try {
      var result = await Addresscollection.insertOne(data.tojson());
      if (result.isSuccess) {
        return "data Inserted";
      } else {
        return "something wrong while inserting data.";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
/*

*/ 
