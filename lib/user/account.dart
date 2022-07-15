// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/users/UserDB.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
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
    
print(" user account :${widget.data}");
    return Scaffold(
      drawer: User(data: widget.data),
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text("บัญชีผู้ใช้งาน"),
        
        actions: [
       // Text("${data.firstName} ${data.lastName}"),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future:UserDatabase.getone("${widget.data['ID_User']}","${widget.data['password']}") ,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  var totalData = snapshot.data.length;
                  print("Total Data  " + totalData.toString());
                  return Row(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data.length ,
                              itemBuilder: (context, index) {
                                return 
                                   list_Users(UserDbModel.fromJson(
                                        snapshot.data[index ]));
                              })),
                    ],
                  );
                } else {
                  return Center(
                    child: Text('No Data available.'),
                  );
                }
              }
            }),
      )),
    );
  }
  Widget list_Users(UserDbModel data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                ClipOval(
                  child: Image.network(
                    "${data.image}",
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 5,
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
            SizedBox(
                  height: 20,
                ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
           
              //////////////////////////User Update////////////////////////////////
              RaisedButton(
                          onPressed: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                                return User_update();
                              },
                              settings: RouteSettings(arguments: data))
                              )
                      .then((value) {
                    setState(() {});
                  });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Update Data User.'),//Messenger Save Data User.
                              ),);},
                          color: Colors.green,
                          child: Text("Insert Data",style: TextStyle(color: Colors.white),))

            ]),
          ],
        ),
      ),
    );
  }
}

                  
                  
                  