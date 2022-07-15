// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/Device/Device.dart';
import 'package:flutter_application/MongoDB/Device/DeviceDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDB.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:mongo_dart/mongo_dart.dart';

class Equipment_Update extends StatelessWidget {
  var ID_DeviceController = new TextEditingController();
  var inventoryController = new TextEditingController();
  var typeController = new TextEditingController();
  var priceController = new TextEditingController();
  var yearController = new TextEditingController();
  var brandController = new TextEditingController();
  var modelController = new TextEditingController();
  var ID_DeskController = new TextEditingController();
  var qualityController = new TextEditingController();

/*
ID_Device 
inventory numder
type
price
year of use
brand
model
ID_Desk
quality
*/
  @override
  Widget build(BuildContext context) {
    DeviceDbModel data =
        ModalRoute.of(context)!.settings.arguments as DeviceDbModel;
    if (data != null) {
      ID_DeviceController.text = data.ID_Device;
      inventoryController.text = data.inventory;
      typeController.text = data.type;
      priceController.text = data.price;
      yearController.text = data.year;
      brandController.text = data.brand;
      modelController.text = data.model;
      ID_DeskController.text = data.ID_Desk;
      qualityController.text = data.quality;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: Text("แก้ไขข้อมูลอุปกรณ์"),
        ),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: ID_DeviceController,
                        decoration: new InputDecoration(labelText: "ID_Device"),
                      ),
                      TextFormField(
                        controller: inventoryController,
                        decoration: new InputDecoration(labelText: "inventory"),
                      ),
                      
                      TextFormField(
                        controller: typeController,
                        decoration: new InputDecoration(labelText: "type"),
                      ),
                      TextFormField(
                        controller: priceController,
                        decoration: new InputDecoration(labelText: "price"),
                      ),
                      TextFormField(
                        controller: yearController,
                        decoration: new InputDecoration(labelText: "year"),
                      ),
                      TextFormField(
                        controller: brandController,
                        decoration:
                            new InputDecoration(labelText: "brand"),
                      ),
                      TextFormField(
                        controller: modelController,
                        decoration: new InputDecoration(labelText: "model"),
                      ),
                      TextFormField(
                        controller: ID_DeskController,
                        decoration: new InputDecoration(labelText: "ID_Desk"),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton(
                              onPressed: () {
                                
                                  _Update(
                                    data.id,
                                    ID_DeviceController.text,
                                    inventoryController.text,
                                    typeController.text,
                                    priceController.text,
                                    yearController.text,
                                    brandController.text,
                                    modelController.text,
                                    ID_DeskController.text,
                                    qualityController.text,
                                    
                                  );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Update Data Equipment.'), //Messenger Save Datas User.
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
    String ID_Device,
    String inventory,
    String type,
    String price,
    String year,
    String brand,
    String model,
    String ID_Desk,
    String quality,
  ) async {
    
    final UpdateData = DeviceDbModel(
      id: id,
      ID_Device: ID_Device,
      inventory: inventory,
      type: type,
      price: price,
      year: year,
      brand: brand,
      model: model,
      ID_Desk:ID_Desk,
      quality: quality,
    );
    await DeviceDatabase.update(UpdateData);
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
ID_Desk
quality
*/
