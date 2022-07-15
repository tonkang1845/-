import 'dart:developer';

import 'package:flutter_application/MongoDB/Inform/informDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/MongoDB/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class informDatabase {
  static var db, informcollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    informcollection = db.collection(INFORM_COLLECTION);
  }

 
  ////////////////////login///////////////////
  static Future<List<Map<String, dynamic>>>getlogin(email,password) async {
     final data = await informcollection.find(where.eq("email",email).eq('password',password)).toList();
    return data;
  }

///////////Update User///////////
  static Future<void> update(informDbModel data) async {
    var result = await informcollection.findOne({"_id": data.id});
    result['ID_Device'] = data.ID_Device;
    result['Proble'] = data.Proble;
    result['firstName'] = data.firstName;
    result['lastName'] = data.lastName;
    result['status'] = data.status;
   
    var response = await informcollection.save(result);
    inspect(response);
  }

///////////delete////////////
  static delete(informDbModel user) async {
    await informcollection.remove(where.id(user.id));
  }

 ////////////list status/////////////
  static Future<List<Map<String, dynamic>>> getstatus() async {
    final arrData = await informcollection.find(where.eq('status', 'In progress')).toList();
    return arrData;
  }
   ////////////list history/////////////
  static Future<List<Map<String, dynamic>>> gethistory() async {
    final arrData = await informcollection.find(where.eq('status', 'Done')).toList();
    return arrData;
  }
  ////////////// firstName //////////
  static Future<List<Map<String, dynamic>>> getfirstName(textdata ) async {
    final data = await informcollection.find(where.eq('firstName',textdata )).toList();
    return data;
  }
static Future<void> Done(informDbModel user) async {
    var result = await informcollection.findOne({"_id": user.id});
    result['status'] = 'Done';
    var response = await informcollection.save(result);
    inspect(response);
  }


  static Future<String> insert(informDbModel data) async {
    try {
      var result = await informcollection.insertOne(data.tojson());
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
  
  //เพิ่มสิ่งที่อยากได้ where มี3แบบ  .gt ค่าตัวเลขที่มากกว่า  .lt  ค่าตัวเลขที่น้อยกว่า  .eq ค้นหาตรงตัวชื่อ

}

/*
1 ID_Device
2 Proble
3 firstName
4 lastName
*/ 