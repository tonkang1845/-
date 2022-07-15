import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/Address/Address.dart';
import 'package:flutter_application/MongoDB/Address/AddressDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDB.dart';
import 'package:flutter_application/admin/admin.dart';
import 'package:flutter_application/from_add/from_map.dart';
import 'package:flutter_application/from_add/from_user.dart';
import 'package:flutter_application/from_add/map_update.dart';
import 'package:flutter_application/from_add/sign_up.dart';

import '../from_add/User_update.dart';

class map extends StatefulWidget {
  const map({Key? key}) : super(key: key);

  @override
  State<map> createState() => _mapState();
}
class _mapState extends State<map>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: admin(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Building Map "),
        
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future:AddressDatabase.getData() ,
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
                                   list_Users(AddressDbModel.fromJson(
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
  Widget list_Users(AddressDbModel data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                  Image.network(
                    "${data.Picture_room}",
                    height: 80.0,
                    width: 80.0,
                    fit: BoxFit.cover,
                  ),
                
              
                SizedBox(
                  height: 5,
                ),
                Text( "  ID Desk  : ${data.ID_desk}  ",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey)
                            ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              //////////////////////////from_User////////////////////////////////
              IconButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                                return from_map();
                              },
                              settings: RouteSettings(arguments: data))
                              )
                      .then((value) {
                    setState(() {});
                  });
                },
                icon: Icon(Icons.art_track ,size: 30,),
                color: Colors.yellow[800],
                
              ),
              //////////////////////////User Update////////////////////////////////
              IconButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                                return map_update();
                              },
                              settings: RouteSettings(arguments: data))
                              )
                      .then((value) {
                    setState(() {});
                  });
                },
                icon: Icon(Icons.edit),
                color: Colors.green,
              ),
              ////////////////////////////////Delete//////////////////////////////
              IconButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Delete?'),
                    content: Text("Delete  : ${data.ID_desk} "),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                         child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await AddressDatabase.delete(data);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Delete ${data.ID_desk}"), //Messenger Save Data User.
                            ),
                          );

                          Navigator.pop(context, 'OK');
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                icon: Icon(Icons.delete),
                color: Colors.red[400],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

/*
1 email
2 password
3 firstName
4 lastName
5 age
6 Phone
7 image
8 seat

*/ 