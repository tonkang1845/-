import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/Inform/informDB.dart';
import 'package:flutter_application/MongoDB/Inform/informDBModel.dart';
import 'package:flutter_application/admin/admin.dart';
import 'package:flutter_application/admin/gps.dart';
import 'package:flutter_application/user/user.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: admin(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("ประวัติการแจ้งปัญหา "),
        actions: [],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: informDatabase.gethistory(),
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "   ชื่อผู้แจ้ง :    ${data.firstName}    ${data.lastName}\n\n"
                    "   ID เครื่อง : ${data.ID_Device} \n\n"
                    "   อาการ  :  ${data.Proble} \n\n"
                    "   สถานะ  : ${data.status}"),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              ////////////////////////////////Delete//////////////////////////////
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.check_circle_outline_rounded ,size: 50,),
                color: Colors.green,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
