import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/Inform/informDB.dart';
import 'package:flutter_application/MongoDB/Inform/informDBModel.dart';
import 'package:flutter_application/admin/admin.dart';
import 'package:flutter_application/admin/gps.dart';
import 'package:flutter_application/user/user.dart';

class notification_list extends StatefulWidget {
  const notification_list({Key? key}) : super(key: key);

  @override
  State<notification_list> createState() => _notification_listState();
}

class _notification_listState extends State<notification_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: admin(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("รายการแจ้งปัญหา "),
        actions: [],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: informDatabase.getstatus(),
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
                                return list_Users(informDbModel
                                    .fromJson(snapshot.data[index]));
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

  Widget list_Users(informDbModel data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "   ชื่อผู้แจ้ง:    ${data.firstName}    ${data.lastName}\n\n"
                    "   ID เครื่อง : ${data.ID_Device} \n\n"
                    "   อาการ  :  ${data.Proble} \n\n"
                    "   สถานะ : ${data.status}\n"),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
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
                          await informDatabase.delete(data);
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
              //////////////////////////GPS////////////////////////////////
              IconButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                                return GPS();
                              },
                              settings: RouteSettings(arguments: data)))
                      .then((value) {
                    setState(() {});
                  });
                },
                icon: Icon(Icons.pin_drop),
                color: Colors.yellow[800],
              ),

              /////////////////////////////////////Done///////////////////////////////////////////////
              IconButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Do you deal with problems? \n'),
                    content: Text(" ID Device :      ${data.ID_Device} \n\n"
                        "Name informer: ${data.firstName} ${data.lastName}\n"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await informDatabase.Done(data);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Maintain :  \n"), //Messenger Save Data User.
                            ),
                          );

                          Navigator.pop(context, 'OK');
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                icon: Icon(Icons.check_outlined),
                color: Colors.green,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
