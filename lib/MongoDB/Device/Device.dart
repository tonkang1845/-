import 'dart:developer';


import 'package:flutter_application/MongoDB/Device/DeviceDBModel.dart';
import 'package:flutter_application/MongoDB/constant.dart';

import 'package:mongo_dart/mongo_dart.dart';

class DeviceDatabase {
  static var Devicedb, devicecollection;
  static connect() async {
    Devicedb = await Db.create(MONGO_CONN_URL);
    await Devicedb.open();
    inspect(Devicedb);
    devicecollection = Devicedb.collection(DEVICE_COLLECTION);
  }

///////////Update User///////////
  static Future<void> update(DeviceDbModel data) async {
    var result = await devicecollection.findOne({"_id": data.id});
    result['ID_Device'] = data.ID_Device ;
    result['inventory'] = data.inventory;
    result['type'] = data.type;
    result['price'] = data.price;
    result['year'] = data.year;
    result['brand'] = data.brand;
    result['model'] = data.model;
    result['quality'] = data.quality;

    var response = await devicecollection.save(result);
    inspect(response);
  }

  ////////////get GPS/////////////
  static Future<List<Map<String, dynamic>>> getGPS(data) async {
    final arrData = await devicecollection.find(where.eq('ID_Device', data)).toList();
    return arrData;
  }
  ////////////get Equipment/////////////
  static Future<List<Map<String, dynamic>>> getEquipment() async {
    final arrData = await devicecollection.find(where.eq('quality', 'Equipment')).toList();
    return arrData;
  }
  
  //////////////////////////////////get Maintain////////////////////////////////////////////////////////
static Future<List<Map<String, dynamic>>> getMaintain() async {
    final arrData = await devicecollection.find(where.eq('quality', 'Maintain')).toList();
    return arrData;
  }
  //////////////////////////////get Expired()////////////////////////////////////////////
static Future<List<Map<String, dynamic>>> getExpired() async {
    final arrData = await devicecollection.find(where.eq('quality', 'Expired')).toList();
    return arrData;
  }
  /////////////////////////////////getdata////////////////////////////////////////////////
  static Future<List<Map<String, dynamic>>> getdata() async {
    final arrData = await devicecollection.find().toList();
    return arrData;
  }
  /////////////////////// Equipment///////////////////////////////
  static Future<void> Equipment(DeviceDbModel user) async {
    var result = await devicecollection.findOne({"_id": user.id});
    result['quality'] = 'Equipment';
    var response = await devicecollection.save(result);
    inspect(response);
  }
  /////////////////////// Maintain///////////////////////////////
  static Future<void> Maintain(DeviceDbModel user) async {
    var result = await devicecollection.findOne({"_id": user.id});
    result['quality'] = 'Maintain';
    var response = await devicecollection.save(result);
    inspect(response);
  }

  /////////////////////// Maintain///////////////////////////////
  static Future<void> Expired(DeviceDbModel user) async {
    var result = await devicecollection.findOne({"_id": user.id});
    result['quality'] = 'Expired';
    var response = await devicecollection.save(result);
    inspect(response);
  }



///////////delete////////////
  static delete(DeviceDbModel user) async {
    await devicecollection.remove(where.id(user.id));
  }



///////////////////////////////////////////////////////
  static Future<String> insert(DeviceDbModel data) async {
    try {
      var result = await devicecollection.insertOne(data.tojson());
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
ID_Device 
inventory numder
type
price
year of use
brand
model
quality
*/ 