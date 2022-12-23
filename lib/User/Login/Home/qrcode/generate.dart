import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/addEmployee.dart';
import 'package:flutter_application_1/User/Login/Home/qrcode/homeqrcodeScreen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class generate extends StatefulWidget {
  const generate({super.key});

  @override
  State<generate> createState() => _generateState();
}

class _generateState extends State<generate> {

  String qrData = "https://qldt.utc.edu.vn/CMCSoft.IU.Web.info/(S(23ljqbc1g2glmncz4ivhpbo3))/StudyRegister/StudyRegister.aspx";
  
  String? dataQr;
  Future<List<AddNhanVien>> datasQrcode () async{
    List<AddNhanVien> userJson = [];
    print('Data: $userJson');
    final res = await FirebaseFirestore.instance.collection('AddNhanvien').get().
     then((value) =>
     value.docs.map((e) => {
    //  print(" check user1111 ${e}"),
     AddNhanVien.fromJson(e.data()),
    //  print(" check user2222  ${ AddNhanVien.fromJson(e.data())}"),
    userJson.add(AddNhanVien.fromJson(e.data()),)
     }).toList()
     );
    // print(" check user  ${userJson}");

    dataQr = "${userJson.map((e) => e.email).
    toList()}${userJson.map((e) => e.id).
    toList()}${userJson.map((e) => e.name).
    toList()}${userJson.map((e) => e.designation).
    toList()}${userJson.map((e) => e.numberphone).
    toList()}${userJson.map((e) => e.gender).toList()}";
    print(" check dat qr ${dataQr}");
    return userJson;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children:[ 
                Container(
                  width: 800,
                  height: 800,
                  decoration: const BoxDecoration(
                    color: Color(0xff567DF4), 
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          Row(
                            children:[
                              IconButton(onPressed: (() {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const QrCodeScreen()));
                              }), icon: const Icon(Icons.arrow_back),color: Colors.white,),
                              const Text('Generate',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                            ],
                          ),
                        ],
                      ),
                    ),
                ),
                Positioned( 
                  top: 123,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: 700,
                    height: 600,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            QrImage(
                              data: dataQr??'',
                              version: QrVersions.auto,
                              gapless: false,
                              size: 200,
                              // embeddedImage: const AssetImage('Image/Qcode.png'),
                              embeddedImageStyle: QrEmbeddedImageStyle(size: const Size(50,50)),
                             ), 
                            const Text('Get Your Data/Link to the QR CODE ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: TextField(
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                controller: qrText,
                                decoration: const InputDecoration(
                                  hintText: "Enter the Data/LINK"
                                ),
                              ),
                            ),
                            //  TextField(
                            //   autofocus: true,
                            //   keyboardType: TextInputType.text,
                            //   controller: idText,
                            //   // ignore: prefer_const_constructors
                            //   decoration: InputDecoration(
                            //     hintText: "Data Id"
                            //   ),
                            // ),
                            //  TextField(
                            //   autofocus: true,
                            //   keyboardType: TextInputType.text,
                            //   controller: nameText,
                            //   // ignore: prefer_const_constructors
                            //   decoration: InputDecoration(
                            //     hintText: "Name"
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 13),
                              child: SizedBox(
                                height: 54,
                                width: 443,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                    )
                                  ),
                                  onPressed: () {
                                    datasQrcode();
                                    // if(qrText.text.isEmpty){
                                    //   setState(() {
                                    //     // qrData = "https://flutter.dev";
                                    //     datasQrcode();
                                    //   });   
                                    // }else{
                                    //  setState(() {
                                    //     // qrData = qrText.text;
                                    //  });  
                                    // }
                                    // print("qrcodeData: ${datasQrcode}");
                                  },
                                  child: const Text('QENERATE QRCODE'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ), 
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  final qrText = TextEditingController();

}
