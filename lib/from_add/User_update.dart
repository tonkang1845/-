// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDB.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:mongo_dart/mongo_dart.dart';

class User_update extends StatelessWidget {
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
          backgroundColor: Colors.green[700],
          title: Text("แก้ไขข้อมูลบัญชีผู้ใช้งาน"),
        ),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      ClipOval(
                    child: Image.network(
                      "${data.image}",
                      height: 150.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: ID_UserController,
                        decoration: new InputDecoration(labelText: "ID_User"),
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: new InputDecoration(labelText: "Password"),
                      ),
                      TextFormField(
                        controller: firstNameController,
                        decoration: new InputDecoration(labelText: "FirstName"),
                      ),
                      TextFormField(
                        controller: lastNameController,
                        decoration: new InputDecoration(labelText: "lastName"),
                      ),
                      TextFormField(
                        controller: ageController,
                        decoration: new InputDecoration(labelText: "age"),
                      ),
                      TextFormField(
                        controller: PhoneController,
                        decoration:
                            new InputDecoration(labelText: "Phone Nunber"),
                      ),
                      TextFormField(
                        controller: imageController,
                        decoration: new InputDecoration(labelText: "image"),
                      ),
                      TextFormField(
                        controller: SeatController,
                        decoration: new InputDecoration(labelText: "Seat code"),
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
                                    ID_UserController.text,
                                    passwordController.text,
                                    firstNameController.text,
                                    lastNameController.text,
                                    ageController.text,
                                    PhoneController.text,
                                    imageController.text,
                                    SeatController.text,
                                  );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Update Data User.'), //Messenger Save Datas User.
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
    String ID_User,
    String password,
    String firstName,
    String lastName,
    String age,
    String Phone,
    String image,
    String seat,
  ) async {
    
    final UpdateData = UserDbModel(
      id: id,
      ID_User: ID_User,
      password: password,
      firstName: firstName,
      lastName: lastName,
      age: age,
      Phone: Phone,
      image: image,
      seat: seat,
    );
    await UserDatabase.update(UpdateData);
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