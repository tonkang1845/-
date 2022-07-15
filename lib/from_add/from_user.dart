// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDB.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:mongo_dart/mongo_dart.dart';

class from_User extends StatelessWidget {
  var ID_UserController = new TextEditingController();
  var passwordController = new TextEditingController();
  var firstNameController = new TextEditingController();
  var lastNameController = new TextEditingController();
  var ageController = new TextEditingController();
  var PhoneController = new TextEditingController();
  var imageController = new TextEditingController();
  var SeatController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserDbModel data =ModalRoute.of(context)!.settings.arguments as UserDbModel;
    if (data != null) {
      ID_UserController.text = data.ID_User;
      passwordController.text = data.password;
      firstNameController.text = data.firstName;
      lastNameController.text = data.lastName;
      ageController.text = data.age;
      PhoneController.text = data.Phone;
      imageController.text = data.image;
      SeatController.text = data.seat;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[800],
          title: Text("${ data.firstName}  ${data.lastName}"),
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
                      "${data.image}",
                      height: 250.0,
                      width: 250.0,
                      fit: BoxFit.cover,
                    ),
                ),
                SizedBox(
                    height: 50,
                ),
                
                Text( 
                  "    ID  :      ${data.ID_User} \n\n"
                 "    password  :        ${data.password} \n\n"
                  "    Name  :       ${data.firstName}  ${data.lastName} \n\n"
                      "    Age:        ${data.age} \n\n"
                      "    Phone number :      ${data.Phone}\n\n"
                      "    Seat  :      ${data.seat}"),
                      ],
                    ),
                  )),
            ),
          ),
        ]));
  }

}

/*
1 ID_User
2 password
3 firstName
4 lastName
5 age
6 position
7 Phone
8 image
9 seat

*/