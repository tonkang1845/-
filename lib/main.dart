
import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/Address/Address.dart';
import 'package:flutter_application/MongoDB/Device/Device.dart';
import 'package:flutter_application/MongoDB/Inform/informDB.dart';
import 'package:flutter_application/MongoDB/users/UserDB.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/admin/admin.dart';
import 'package:flutter_application/user/user.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:flutter_application/admin/user_account.dart';
import 'package:flutter_application/from_add/sign_up.dart';
import 'package:flutter_application/user/account.dart';
import 'package:flutter_application/admin/add_device.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserDatabase.connect();
  await DeviceDatabase.connect();
  await AddressDatabase.connect();
  await informDatabase.connect();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var  ID_UserController = new TextEditingController();
  var passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 100.0, 0.0, 0.0),
                    child: Text('I',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[800])),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40.0, 100.0, 0.0, 0.0),
                    child: Text('nform',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40.0, 180.0, 0.0, 0.0),
                    child: Text("C",
                        style: TextStyle(
                            fontSize: 70.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[700])),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(86.0, 180.0, 0.0, 0.0),
                    child: Text("omputer",
                        style: TextStyle(
                            fontSize: 70.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(80.0, 255.0, 0.0, 0.0),
                    child: Text('P',
                        style: TextStyle(
                            fontSize: 70.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700])),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(125.0, 255.0, 0.0, 0.0),
                    child: Text('roblems',
                        style: TextStyle(
                            fontSize: 70.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey)),
                  )
                ],
              ),
            ),
//////////////////////////////////////////////////////////////////////////////////////////////////////////

            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: ID_UserController,
                      decoration: InputDecoration(
                          labelText: 'ID',
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                      obscureText: true,
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                           login(
                              ID_UserController.text,
                              passwordController.text,
                              
                              
                            );
                           
                          },
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                      child: Text('- OR -',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey)),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.red[400],
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return sign_up(); //หน้าฟอร์มลงทะเบียน
                              
                            }
                            ));
                            
                          },
                          child: Center(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  Future<void> login(

    String email,
    String password,
 
  ) async {
    if (passwordController.text.isNotEmpty&&ID_UserController.text.isNotEmpty) {
        final  data = await UserDatabase.getlogin(ID_UserController.text, passwordController.text);
        print(" User : ${data}");
        print("length User : ${data.length}");
        /////////////////////////login Admin///////////////////////////////////////
        if(passwordController.text=="0000" && ID_UserController.text == "admin"){
          Navigator.push(context, new MaterialPageRoute(
               builder: (context)=>new admin()
               ),);
               ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Hello ${ID_UserController.text}"), //Messenger Save Data User.
                            ),
                          );
        }
        ////////////////////////login User///////////////////////////////////////////
        if(data.length==1){
              Navigator.push(context, new MaterialPageRoute(
               builder: (context)=>new account(data:data[0])
               ),);

               ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Hello  User :${ID_UserController.text}"), //Messenger Save Data User.
                            ),
                          );
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Sorry. please try again."), //Messenger Save Data User.
                            ),
                          );
        }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Blank value found"), //Messenger Save Data User.
                            ),
                          );
    }
}
}