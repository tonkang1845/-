import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDB.dart';
import 'package:flutter_application/admin/admin.dart';
import 'package:flutter_application/from_add/from_user.dart';
import 'package:flutter_application/from_add/sign_up.dart';

import '../from_add/User_update.dart';

class user_account extends StatefulWidget {
  const user_account({Key? key}) : super(key: key);

  @override
  State<user_account> createState() => _user_accountState();
}
class _user_accountState extends State<user_account>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: admin(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("บัญชีผู้ใช้งานทั้งหมด"),
        actions: [
          IconButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                                return sign_up();
                              },
                              ));
                      
                },
                icon: Icon(Icons.add_box_outlined,size: 30,),
                color: Colors.white,
              ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future:UserDatabase.getData() ,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                ClipOval(
                  child: Image.network(
                    "${data.image}",
                    height: 80.0,
                    width: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("    ชื่อ : ${data.firstName}  ${data.lastName} \n\n"
                    "    อายุ:  ${data.age} \n\n"
                    "    เบอร์โทร : ${data.Phone}\n\n "
                    "    โต๊ะ  : ${data.seat}"),
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
                                return from_User();
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
                                return User_update();
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
                    content: Text(" Name : ${data.firstName} ${data.lastName}"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                         child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await UserDatabase.delete(data);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Delete ${data.firstName}${data.lastName}"), //Messenger Save Data User.
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