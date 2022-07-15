// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDB.dart';

import 'package:mongo_dart/mongo_dart.dart' as M;

class sign_up extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Apply for an account"),
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
                    controller: ID_UserController,
                    decoration: new InputDecoration(labelText: "ID User"),
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
                    decoration: new InputDecoration(labelText: "Phone Nunber"),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      RaisedButton(
                          onPressed: () {
                            _inesrDataUser(
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
                                content: Text('Save Data User.'),//Messenger Save Data User.
                              ),);},
                          color: Colors.green,
                          child: Text("Insert Data",style: TextStyle(color: Colors.white),))
                    ],) ],)),),),] ));}

  Future<void> _inesrDataUser(
    String ID_User,
    String password,
    String firstName, 
    String lastName, 
    String age, 
    String Phone, 
    String image, 
    String seat,
  ) async {
    var _id = M.ObjectId();
    final data = UserDbModel(
        id: _id, 
        ID_User:ID_User,
        password :password,
        firstName: firstName, 
        lastName: lastName,
        age:age,
        Phone:Phone,
        image:image,
        seat:seat,
        );
    var result = await  UserDatabase.inesrt(data); 
    _clearALL();
  }
  void _clearALL() {
    ID_UserController.text= "";
    passwordController.text= "";
    firstNameController.text= "";
    lastNameController.text = "";
    ageController.text= "";
    PhoneController.text= "";
    imageController.text= "";
    SeatController.text= "";
}}
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