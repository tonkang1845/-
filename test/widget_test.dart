// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/users/UserDB.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/admin/map.dart';
import 'package:flutter_application/from_add/User_update.dart';
import 'package:flutter_application/user/user.dart';


class account extends StatefulWidget {
 
  const account({Key? key , required this.data}) : super(key: key);
  final Map <String ,dynamic  > data;

  @override
  State<account> createState() => _accountState();
}
class _accountState extends State<account>{
  
  @override
  Widget build(BuildContext context) { 
  
   return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[800],
        ),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      children: [
                       ClipOval(
                    child: Image.network(
                      "${widget.data['image']}",
                      height: 250.0,
                      width: 250.0,
                      fit: BoxFit.cover,
                    ),
                ),
                SizedBox(
                    height: 50,
                ),
                
                Text( 
                  "    ID  :     ${widget.data['ID_User']} \n\n"
                 "    password  :       ${widget.data['password']} \n\n"
                  "    Name  :       ${widget.data['firstName']}  ${widget.data['lastName']} \n\n"
                      "    Age:      ${widget.data['age']}\n\n"
                      "    Phone number :      ${widget.data['Phone']}\n\n"
                      "    Seat  :     ${widget.data['seat']}"),
                      ],
                    ),
                  )),
            ),
          ),
        ]));
  }
}

                  
                  
                  