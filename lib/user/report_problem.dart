// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/Inform/informDB.dart';
import 'package:flutter_application/MongoDB/Inform/informDBModel.dart';
import 'package:flutter_application/user/user.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class report_problem extends StatefulWidget {
 const report_problem({Key? key , required this.data}) : super(key: key);
  final Map <String ,dynamic  > data;
  @override
  State<report_problem> createState() => _report_problemState();
}

class _report_problemState extends State<report_problem> {
  var ID_DeviceController = new TextEditingController();
  var ProbleController = new TextEditingController();
  var firstNameController = new TextEditingController();
  var lastNameController = new TextEditingController();
  var statusController = "In progress";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: User(),
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text("แจ้งปัญหา "),
      ),
      body: Column(
        children:[
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [ 
                  
                  TextFormField(
                    controller: firstNameController,
                    decoration: new InputDecoration(labelText: "ชื่อ"),
                  ),
                  TextFormField(
                    controller: lastNameController,
                    decoration: new InputDecoration(labelText: "นามสกุล"),
                  ),
          
                  TextFormField(
                    controller: ID_DeviceController,
                    decoration: new InputDecoration(labelText: "ID เครื่อง"),
                  ),
                  TextFormField(
                    controller: ProbleController,
                    
                    decoration: new InputDecoration(labelText: "อาการ"),
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
                              ID_DeviceController.text,
                              ProbleController.text,
                              firstNameController.text,
                              lastNameController.text, 
                              statusController
                              );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Report Data User.'),//Messenger Save Data User.
                              ),
                            );
                          },
                          color: Colors.green,
                          child: Text("Report",style: TextStyle(color: Colors.white),))
                    ],
                  )
                ],
              )),
          ),
        ),
      ] 
    )
    
    );
  }
  
 Future<void> _inesrDataUser(
    String ID_Device,
    String Proble,
    String firstName, 
    String lastName, 
    String status,
  ) async {
    var _id = M.ObjectId();
    final data = informDbModel(
        id: _id, 
        ID_Device:ID_Device,
        Proble :Proble,
        firstName: firstName, 
        lastName: lastName,
        status:status,
        );
 var result = await  informDatabase.insert(data);
    
    _clearALL();
  }
  void _clearALL() {
    ID_DeviceController.text= "";
    ProbleController.text= "";
    firstNameController.text= "";
    lastNameController.text = "";
}
}

 /*
1 ID_Device
2 Proble
3 firstName
4 lastName
5 status
*/ 