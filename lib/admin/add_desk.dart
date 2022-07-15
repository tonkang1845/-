// ignore_for_file: deprecated_member_use
import 'package:flutter_application/MongoDB/Address/Address.dart';
import 'package:flutter_application/MongoDB/Address/AddressDBModel.dart';

import 'package:flutter_application/admin/admin.dart';
import 'package:flutter/material.dart';

import 'package:mongo_dart/mongo_dart.dart' as M;

class add_desk extends StatelessWidget {
  var ID_deskController = new TextEditingController();
  var picture_floorController = new TextEditingController();
  var Picture_roomController = new TextEditingController();
  var floorController = new TextEditingController();
  var roomController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: admin(),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Add Desk"),
        ),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: ID_deskController,
                        decoration: new InputDecoration(labelText: "ID Desk"),
                      ),
                      TextFormField(
                        controller: picture_floorController,
                        decoration:
                            new InputDecoration(labelText: " Picture Floor"),
                      ),
                      TextFormField(
                        controller: Picture_roomController,
                        decoration:
                            new InputDecoration(labelText: "Picture Room"),
                      ),
                      TextFormField(
                        controller: floorController,
                        decoration: new InputDecoration(labelText: "Floor"),
                      ),
                      TextFormField(
                        controller: roomController,
                        decoration: new InputDecoration(labelText: "Room"),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton(
                              onPressed: () {
                                _inesrDataUser(
                                    ID_deskController.text,
                                    picture_floorController.text,
                                    Picture_roomController.text,
                                    floorController.text,
                                    roomController.text,
                                    );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Save Data Device.'), //Messenger Save Data User.
                                  ),
                                );
                              },
                              color: Colors.green,
                              child: Text(
                                "Insert Data",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ]));
  }

  Future<void> _inesrDataUser(
    String ID_desk,
    String picture_floor,
    String Picture_room,
    String floor,
    String room,
  ) async {
    var _id = M.ObjectId();
    final data = AddressDbModel(
      id: _id,
      ID_desk: ID_desk,
      picture_floor: picture_floor,
      Picture_room: Picture_room,
      floor: floor,
      room: room,
    );
    var result = await AddressDatabase.insert(data);
    _clearALL();
  }

  void _clearALL() {
    ID_deskController.text = "";
    picture_floorController.text = "";
    Picture_roomController.text = "";
    floorController.text = "";
    roomController.text = "";

  }
}
