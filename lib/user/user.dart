import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/main.dart';
import 'package:flutter_application/user/account.dart';
import 'package:flutter_application/user/record.dart';
import 'package:flutter_application/user/report_problem.dart';
class User extends StatefulWidget {
    const User({Key? key , required this.data}) : super(key: key);
  final Map <String ,dynamic  > data;
  
  @override
  
  State<User> createState() => _UserState();
}

class _UserState extends State<User> 
{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.orange[400],
            
            automaticallyImplyLeading: false,
            title: Text("MENU" ),
          ),
        
          ListTile(
            leading:
                  Icon(Icons.account_circle , size: 30, color: Colors.blueGrey),
              title: Text("บัญชีผู้ใช้งาน"),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new account(data:widget.data)),
                );
              }),

              ListTile(
                leading:
                  Icon(Icons.add_alert_outlined, size: 30, color: Colors.blueGrey),
              title: Text("แจ้งปัญหา"),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new report_problem(data:widget.data)),
                );
              }),
          ListTile(
            leading:
                  Icon(Icons.article_outlined, size: 30, color: Colors.blueGrey),
              title: Text("รายการแจ้งปัญหา"),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new record(data:widget.data,)),
                );
              }),
              ListTile(
                leading:
                  Icon(Icons.output, size: 30, color: Colors.blueGrey),
              title: Text("ออกจากระบบ"),
                onTap: ()
                {
                  
                Navigator.push(context, MaterialPageRoute(builder: (context){
                        return MyApp();//หน้าฟอร์มลงทะเบียน

                      }));
                }
            
          )
          
        ],
      ),
    );
  }
}