

import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDB/Inform/informDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDBModel.dart';
import 'package:flutter_application/MongoDB/users/UserDB.dart';

import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:mongo_dart/mongo_dart.dart';

class GPS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    informDbModel data =ModalRoute.of(context)!.settings.arguments as informDbModel;
    
     return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[800],
          title: Text("${data.ID_Device}"),
        ),
        body: ListView(
          children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text( "    floor  :        1 \n"),
                       Image.network(
                          "https://lh3.googleusercontent.com/pw/AM-JKLXMiW0Vq6a6ODO_dewXSLL6tK-KoFlrZ9uFyl-fYhVvXHmO-sGj4eEGqdjhqHGNGfwmp5fKcrZQRY1sIgok-lH42FTHYm_1GJjd2qj35mpYbHt6xUpwQKOn3HmQUe9wbuDskwxKeUdp1sZ4qRbH4nJS=w878-h777-no?authuser=1",
                          height: 250.0,
                          width: 250.0,
                          fit: BoxFit.cover,
                        ),

                        Text(   "    room  :       1C-15,16 "),
                        Image.network(
                          "https://lh3.googleusercontent.com/wN_rAOTXDmY8H_LPNrVEknzmtwTdo5VnWxdmOrqEnCyzt1cWBGDfmq3Pn8xCKoqehQZTb3VVpl0dhXXmk2onKe25SY2h6c02O6dZGZMZeB98ry2yCq-ab-yr6sZcf6jj02_DlRWXa7JPewOqZ3a3xYlruhmFb7i-tMgvcBI5GYw8wyNEr9jmpwk4F49v983UDZrWS8GcE3ZQWX4c0YL-isS0qtTnrD2JHSG8WOH5yTXJNMm_7W_HOxeM2SeYiEShFmC_yMHuAalrCvC5iVTnOsHHFrn9SpwRG_6fdnfE1GpD3Yu6OiWzoib-Oo6XGEo5BW92Rk9_RLuUP_48Iegj5sF-I5K5LWqH-epme2BspHNOk4W8KF6x7y8Ba_Zkub931iJ1-EDa8Jir8W1p22c9dFP2FkbA0Ux4GB4NALxQbL2Fw5vaYLSCOTTYvJwRB6tfOewWGID1YpglCX2UY7_G686XYaqmb-01SKI3Rhl07mMPaA2NL-H3jJTuU-b-fEqJ3PuAWCYkZJcGaWhJQmNywbAuDML3q_OC-9Dqx_RoHa2J3mE6hBmHyJ9qKG0uUM0nq-WEu-G8_93jMwgXXItA4wrjjtO-vjFTflIGxq3J5gNzBBZ--plFRaE6MtK807RIyyV17n2EbbrppdJZYrRZAURJzFTd-ivMJ8YJdlDycztEy2u-2ASIT8L4l1wVDRUcfedibPAzn009_3yxseuFMMt9DWe3eOsS74iQKMFCmPs2I_COthHJQBrIpOo6O1UAvHtIOfho5XtpYC-Wndmn7q7njqy7bsYBFwdsncF8oei4Ia6TgvQuFOX5JKwsvOQX5sVGXZYwk5lKZnSeyY38RGtXNsFBU_1WZ5NSjgHNCEsLJJrgpW6qpNFMQJ2ukcclJVCKhyRy2qG8Fg=w879-h778-no?authuser=1",
                          height: 250.0,
                          width: 250.0,
                          fit: BoxFit.cover,
                        ),

                        Text("    ID_desk  :      ${data.ID_Device} \n\n"
                          ),
                      ],
                    ),
                  )),
            ),
          ),
        ]));
  }

}
