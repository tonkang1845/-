// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/Address/AddressDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDB.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:mongo_dart/mongo_dart.dart';

class from_map extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    AddressDbModel data =
        ModalRoute.of(context)!.settings.arguments as AddressDbModel;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[800],
          title: Text("${data.ID_desk}"),
        ),
        body: ListView(
          children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text( "    floor  :        ${data.floor} \n"),
                       Image.network(
                          "${data.picture_floor}",
                          height: 250.0,
                          width: 250.0,
                          fit: BoxFit.cover,
                        ),

                        Text(   "    room  :       ${data.room} "),
                        Image.network(
                          "${data.Picture_room}",
                          height: 250.0,
                          width: 250.0,
                          fit: BoxFit.cover,
                        ),

                        Text("    ID_desk  :      ${data.ID_desk} \n\n"
                          ),
                      ],
                    ),
                  )),
            ),
          ),
        ]));
  }
}

/*
 ID_desk,
     picture_floor,
     Picture_room,
     floor,
     room,

*/