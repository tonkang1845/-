import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/admin/add_desk.dart';

import 'package:flutter_application/admin/add_device.dart';

import 'package:flutter_application/admin/equipment_inventory.dart';
import 'package:flutter_application/admin/gps.dart';
import 'package:flutter_application/admin/history.dart';
import 'package:flutter_application/admin/map.dart';
import 'package:flutter_application/admin/notifications.dart';
import 'package:flutter_application/admin/user_account.dart';
import 'package:flutter_application/main.dart';
import 'package:flutter_application/user/account.dart';

class admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.blueGrey,
            automaticallyImplyLeading: false,
            leading: Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            title: Text("เมนู"),
          ),
          ListTile(
              leading:
                  Icon(Icons.badge_rounded, size: 30, color: Colors.blueGrey),
              title: Text("จัดการบัญชีผู้ใช้งาน"),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new user_account()),
                );
              }),
          ListTile(
              leading: Icon(Icons.engineering_rounded,
                  size: 30, color: Colors.blueGrey),
              title: Text("รายการแจ้งปัญหา "),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new notification_list()),
                );
              }),
          ListTile(
              leading:
                  Icon(Icons.browser_updated, size: 30, color: Colors.blueGrey),
              title: Text("เพิ่มอุปกรณ์"),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new add_device()),
                );
              }),
          ListTile(
              leading: Icon(Icons.corporate_fare_outlined,
                  size: 30, color: Colors.blueGrey),
              title: Text("คลังเก็บอุปกรณ์"),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new equipment_inventory()),
                );
              }),
          
          

              ListTile(
              leading:
                  Icon(Icons.article_outlined , size: 30, color: Colors.blueGrey),
              title: Text("ประวัติรายการแก้ไขปัญหา  "),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new History()),
                );
              }),
      

          ListTile(
              leading: Icon(Icons.output, size: 30, color: Colors.blueGrey),
              title: Text("ออกจากระบบ"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyApp();
                }));
              })
        ],
      ),
    );
  }
}
