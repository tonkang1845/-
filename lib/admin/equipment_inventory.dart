import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/Device/Device.dart';
import 'package:flutter_application/MongoDB/Device/DeviceDBModel.dart';
import 'package:flutter_application/admin/admin.dart';

import 'package:flutter_application/from_add/Equipment_Update.dart';


class equipment_inventory extends StatelessWidget {

  @override
   Widget build(BuildContext context) {
      final ButtonStyle style =TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        drawer: admin(),
        appBar: AppBar( 
          backgroundColor: Colors.blueGrey,
          title: const Text('Equipment Inventory'),
          
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.computer,),
                
                text: ('ใช้งานได้ '),
                
              ),
              Tab(icon: Icon(Icons.build),
                text: ('ซ่อมแซม'),
              ),
              Tab(
                icon: Icon(Icons.delete),
               text: ('กำจัดทิ้ง'),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          
          children:[
            Equipment(),
            Maintain(),
            Expired(),
            
            
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////Equipment()/////////////////////////////////////////
class Equipment extends StatefulWidget {
  const Equipment({ Key? key }) : super(key: key);

  @override
  State<Equipment> createState() => _EquipmentState();
}
class _EquipmentState extends State<Equipment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future:DeviceDatabase.getEquipment() ,
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
                                   list_Users(DeviceDbModel.fromJson(
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

  Widget list_Users(DeviceDbModel data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                
                Text("   ID เครื่อง : ${data.ID_Device} \n"
                    "    หมายเลยครุภัณฑ์ :  ${data.inventory} \n"
                    "    ประเภท :    ${data.type} \n"
                    "    ราคา : ${data.price}\n "
                    "   อายุการใช้งาน : ${data.year}\n "
                    "    ยี้ห้อ  : ${data.brand}\n"
                    "    รุ่น  : ${data.model}\n"
                    "    โต๊ะ  : ${data.ID_Desk}\n"

                   
                    
                    
                    ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              //////////////////////////User Update////////////////////////////////
              IconButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Equipment_Update() ;
                              },
                              settings: RouteSettings(arguments: data)))
                      .then((value) {
                    setState(() {});
                  });
                },
                icon: Icon(Icons.edit),
                color: Colors.green,
              ),
              ///////////////////////////////////Maintain//////////////////////////////////////////////
              IconButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Maintain?'),
                    content: Text("  Maintain : ${data.quality} "),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await DeviceDatabase.Maintain(data);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Maintain : ${data.quality} \n"), //Messenger Save Data User.
                            ),
                          );

                          Navigator.pop(context, 'OK');
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                icon: Icon(Icons.build),
                color: Colors.yellow[800],
              ),
              ////////////////////////////////Delete//////////////////////////////
              IconButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Expired?'),
                    content: Text("   ID Device : ${data.ID_Device} "),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await DeviceDatabase.Expired(data);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Expired  ID Device : ${data.ID_Device} \n"), //Messenger Save Data User.
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
//////////////////////////////////////////////Maintain()//////////////////////////////////////////
class Maintain extends StatefulWidget {
  const Maintain({ Key? key }) : super(key: key);

  @override
  State<Maintain> createState() => _MaintainState();
}
class _MaintainState extends State<Maintain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          
            future:DeviceDatabase.getMaintain() ,
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
                                return  list_Users(DeviceDbModel.fromJson(
                                        snapshot.data[index]));
                              })),
                    ],
                  );
                } else {
                  return Center(
                    child: Text('No Data available.'),
                  );
                }
              }
            }
            ),
      )),
    );
  }
  
  Widget list_Users(DeviceDbModel data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                
                Text("   ID เครื่อง : ${data.ID_Device} \n"
                    "    หมายเลยครุภัณฑ์ :  ${data.inventory} \n"
                    "    ประเภท :    ${data.type} \n"
                    "    ราคา : ${data.price}\n "
                    "   อายุการใช้งาน : ${data.year}\n "
                    "    ยี้ห้อ  : ${data.brand}\n"
                    "    รุ่น  : ${data.model}\n"
                    "    โต๊ะ  : ${data.ID_Desk}\n"

                    
                    
                    ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              
              ///////////////////////////////////Equipment//////////////////////////////////////////////
              IconButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Equipment?'),
                    content: Text("  Equipment : ${data.quality} "),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await DeviceDatabase.Equipment(data);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Equipment : ${data.quality} \n"), //Messenger Save Data User.
                            ),
                          );

                          Navigator.pop(context, 'OK');
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                icon: Icon(Icons.computer),
                color: Colors.blue[400],
              ),

              //////////////////////////User Update////////////////////////////////
              IconButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Equipment_Update() ;
                              },
                              settings: RouteSettings(arguments: data)))
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
                    title: const Text('Expired?'),
                    content: Text("   ID Device : ${data.ID_Device} "),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await DeviceDatabase.Expired(data);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Expired  ID Device : ${data.ID_Device} \n"), //Messenger Save Data User.
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
//////////////////////////////////////Expired()////////////////////////////////////////////////////////////
class Expired extends StatefulWidget {
  const Expired({ Key? key }) : super(key: key);

  @override
  State<Expired> createState() => _ExpiredState();
}

class _ExpiredState extends State<Expired> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          
            future:DeviceDatabase.getExpired() ,
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
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return  list_Users(DeviceDbModel.fromJson(
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
            }
            ),
      )),
    );
  }

  Widget list_Users(DeviceDbModel data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                
                Text("   ID เครื่อง : ${data.ID_Device} \n"
                    "    หมายเลยครุภัณฑ์ :  ${data.inventory} \n"
                    "    ประเภท :    ${data.type} \n"
                    "    ราคา : ${data.price}\n "
                    "   อายุการใช้งาน : ${data.year}\n "
                    "    ยี้ห้อ  : ${data.brand}\n"
                    "    รุ่น  : ${data.model}\n"
                    "    โต๊ะ  : ${data.ID_Desk}\n"

                    
                    
                    ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              
              ///////////////////////////////////Equipment//////////////////////////////////////////////
              IconButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Equipment?'),
                    content: Text("  Equipment : ${data.quality} "),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await DeviceDatabase.Equipment(data);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Equipment : ${data.quality} \n"), //Messenger Save Data User.
                            ),
                          );

                          Navigator.pop(context, 'OK');
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                icon: Icon(Icons.computer),
                color: Colors.blue[400],
              ),

              //////////////////////////User Update////////////////////////////////
              IconButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Equipment_Update() ;
                              },
                              settings: RouteSettings(arguments: data)))
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
                    content: Text("   ID Device : ${data.ID_Device} "),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await DeviceDatabase.delete(data);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Delete  ID Device : ${data.ID_Device} \n"), //Messenger Save Data User.
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