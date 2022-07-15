// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/Address/Address.dart';
import 'package:flutter_application/MongoDB/Address/AddressDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDB.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:mongo_dart/mongo_dart.dart';

class map_update extends StatelessWidget {
  var ID_deskController = new TextEditingController();
  var picture_floorController = new TextEditingController();
  var  Picture_roomController = new TextEditingController();
  var floorController = new TextEditingController();
  var roomController = new TextEditingController();
/*
 ID_desk;
     picture_floor;
     Picture_room; 
     floor;
     room;
*/
  @override
  Widget build(BuildContext context) {
    AddressDbModel data =ModalRoute.of(context)!.settings.arguments as AddressDbModel;
    if (data != null) {
      ID_deskController.text = data.ID_desk;
      picture_floorController.text = data.picture_floor;
      Picture_roomController.text = data.Picture_room;
      floorController.text = data.floor;
      roomController.text = data.room;

    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: Text("Update Map"),
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
                        decoration: new InputDecoration(labelText: "ID_desk"),
                      ),
                      TextFormField(
                        controller: picture_floorController,
                        decoration: new InputDecoration(labelText: "picture_floor"),
                      ),
                      TextFormField(
                        controller: Picture_roomController,
                        decoration: new InputDecoration(labelText: "Picture_room"),
                      ),
                      TextFormField(
                        controller: floorController,
                        decoration: new InputDecoration(labelText: "floor"),
                      ),
                      TextFormField(
                        controller: roomController,
                        decoration: new InputDecoration(labelText: "room"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton(
                              onPressed: () {
                                  _Update(
                                    data.id,
                                    ID_deskController.text,
                                    picture_floorController.text,
                                    Picture_roomController.text,
                                    floorController.text,
                                    roomController.text,
                                  );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Update Data MAP.'), //Messenger Save Datas User.
                                  ),
                                );
                              },
                              color: Colors.green,
                              child: Text("UpDate",style: TextStyle(color: Colors.white),))
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ]));
  }

  Future<void> _Update(
    ObjectId id,
    String ID_desk,
    String picture_floor,
    String Picture_room,
    String floor,
    String room,

  ) async {
    
    final UpdateData = AddressDbModel(
      id: id,
      ID_desk: ID_desk,
      picture_floor: picture_floor,
      Picture_room: Picture_room,
      floor: floor,
      room: room,

    );
    await AddressDatabase.update(UpdateData);
  }
}

/*
 ID_desk;
     picture_floor;
     Picture_room; 
     floor;
     room;
*/