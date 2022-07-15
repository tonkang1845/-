import 'dart:developer';

import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/MongoDB/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class UserDatabase {
  static var db, usercollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    usercollection = db.collection(USER_COLLECTION);
  }

 
  ////////////////////login///////////////////
  static Future<List<Map<String, dynamic>>>getlogin(ID_User,password) async {
     var data = await usercollection.find(where.eq("ID_User",ID_User).eq('password',password)).toList();
     print("getlogin : ${data}");
    return data;
  }
 
///////////Update User///////////
  static Future<void> update(UserDbModel data) async {
    var result = await usercollection.findOne({"_id": data.id});
    result['ID_User'] = data.ID_User;
    result['password'] = data.password;
    result['firstName'] = data.firstName;
    result['lastName'] = data.lastName;
    result['age'] = data.age;
    result['Phone'] = data.Phone;
    result['image'] = data.image;
    result['seat'] = data.seat;
    var response = await usercollection.save(result);
    inspect(response);
  }

///////////delete////////////
  static delete(UserDbModel user) async {
    await usercollection.remove(where.id(user.id));
  }
 ////////////list users/////////////
  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await usercollection.find().toList();

    return arrData;
  }

  ////////////user one /////////////
 static Future<List<Map<String, dynamic>>> getone(ID_User,password) async {
    final arrData = await usercollection.find(where.eq("ID_User",ID_User).eq('password',password)).toList();

    return arrData;
  }
 
  ////////////////////////////////inesrt//////////////////////////////////////////////////
  static Future<String> inesrt(UserDbModel data) async {
    try {
      var result = await usercollection.insertOne(data.tojson());
      if (result.isSuccess) {
        return "data Inserted";
      } else {
        return "something wrong while inserting data.";
      }
    } 
    catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
  
  //เพิ่มสิ่งที่อยากได้ where มี3แบบ  .gt ค่าตัวเลขที่มากกว่า  .lt  ค่าตัวเลขที่น้อยกว่า  .eq ค้นหาตรงตัวชื่อ

}
