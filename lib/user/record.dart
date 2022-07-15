import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/Inform/informDB.dart';
import 'package:flutter_application/MongoDB/Inform/informDBModel.dart';

import 'package:flutter_application/user/user.dart';

class record extends StatelessWidget {

  const record({Key? key , required this.data}) : super(key: key);
  final Map <String ,dynamic  > data;
  @override
   Widget build(BuildContext context) {
    return Scaffold(
       drawer: User(data:data),
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text("รายการแแจ้งปัญหา ${data['firstName']} ${data['lastName']}"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
           
            FutureBuilder(
              
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
                      return Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return 
                                list_Users(informDbModel.fromJson(
                                  snapshot.data[index]
                                  )//ฟังก์ชันเรียกใช้ส่งข้อมูลที่นี่ การแปลงข้อมูล (แบบฟอร์ม Json) เป็นคลาสโมเดลของเรา
                                        );
                              }));
                    } else {
                      return Center(
                        child: Text('No Data available.'),
                      );
                    }
                  }
                }),
          ],
        ),
      )
      ),
    );
  }
  Widget list_Users(informDbModel data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
                Text('ID เครื่อง :  ${data.ID_Device} \n\n'
                'ชื่อ : ${data.firstName}   ${data.lastName}\n\n'
                'อาการ :  ${data.Proble}'
                
                ),
           
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
             
             Text("${data.status}",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)
        ),IconButton(
                onPressed: () {},
                icon: Icon(Icons.restart_alt ,size: 30,),
                color: Colors.blueGrey,
              ),
        ]
        ),
          ],
        ),
      ),
    );
  }

}