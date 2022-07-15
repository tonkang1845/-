// ignore_for_file: deprecated_member_use
import 'package:flutter_application/MongoDB/Device/Device.dart';
import 'package:flutter_application/admin/admin.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application/MongoDB/Device/DeviceDBModel.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class add_device extends StatelessWidget {
  var ID_DeviceController = new TextEditingController();
  var inventoryController = new TextEditingController();
  var typeController = new TextEditingController();
  var priceController = new TextEditingController();
  var yearController = new TextEditingController();
  var brandController = new TextEditingController();
  var modelController = new TextEditingController();
   var ID_DeskController = new TextEditingController();
  var qualityController = "Equipment";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        drawer: admin(),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("เพิ่มบัญชีอุปกรณ์"),
        ),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Image.network(
                  "https://png.pngtree.com/png-vector/20191022/ourlarge/pngtree-beautiful-computer-vector-glyph-icon-png-image_1844559.jpg",
                  height: 200.0,
                  width: 200.0,
                  fit: BoxFit.cover,
                ),
                      TextFormField(
                        controller: ID_DeviceController,
                        decoration: new InputDecoration(labelText: "ID เครื่อง"),
                      ),
                      TextFormField(
                        controller: inventoryController,
                        decoration: new InputDecoration(labelText: "หมายเลยครุภัณฑ์"),
                      ),
                      TextFormField(
                        controller: typeController,
                        decoration: new InputDecoration(labelText: "ปรเภทอุปกรณ์"),
                      ),
                      TextFormField(
                        controller: priceController,
                        decoration: new InputDecoration(labelText: "ราคา"),
                      ),
                      TextFormField(
                        controller: yearController,
                        decoration: new InputDecoration(labelText: "อายุการใช้งาน"),
                      ),
                      TextFormField(
                        controller: brandController,
                        decoration: new InputDecoration(labelText: "ยี้ห้อ"),
                      ),
                      TextFormField(
                        controller: modelController,
                        decoration:new InputDecoration(labelText: "รุ่น"),
                      ),
                      TextFormField(
                        controller: ID_DeskController,
                        decoration:new InputDecoration(labelText: "โต๊ะ"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton(
                              onPressed: () {
                                _inesrDataUser(
                                  ID_DeviceController.text,
                                  inventoryController.text,
                                  typeController.text,
                                  priceController.text,
                                  yearController.text,
                                  brandController.text,
                                  modelController.text,
                                  ID_DeskController.text,
                                  qualityController
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
    var _id = M.ObjectId();
    final data = DeviceDbModel(
      id: _id,
      ID_Device: ID_Device,
      inventory: inventory,
      type: type,
      price: price,
      year: year,
      brand: brand,
      model: model,
      ID_Desk:ID_Desk,
      quality:quality,
    );
    var result = await DeviceDatabase.insert(data);

    _clearALL();
  }
  void _clearALL() {
    ID_DeviceController.text="";
    inventoryController.text = "";
    typeController.text = "";
    priceController.text = "";
    yearController.text = "";
    brandController.text = "";
    modelController.text = "";
    ID_DeskController.text="";
    qualityController="";
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