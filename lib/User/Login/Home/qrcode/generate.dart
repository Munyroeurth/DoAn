import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/User/Login/Home/qrcode/homeqrcodeScreen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class generate extends StatefulWidget {
  const generate({super.key});

  @override
  State<generate> createState() => _generateState();
}

class _generateState extends State<generate> {

  String qrData = "https://qldt.utc.edu.vn/CMCSoft.IU.Web.info/(S(23ljqbc1g2glmncz4ivhpbo3))/StudyRegister/StudyRegister.aspx";
  

  final docDatas = [];
  final docId =[];//// k có cho commit file len 

  Future DatasQrcode () async{
    final dataqrcode = await FirebaseFirestore.instance.collection('AddNhanvien').snapshots();
    debugPrint('dataqrcode${dataqrcode}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Generate')),
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
                              data: qrData,
                              version: QrVersions.auto,
                              gapless: false,
                              size: 200,
                              embeddedImage: const AssetImage('Image/Qcode.png'),
                              embeddedImageStyle: QrEmbeddedImageStyle(size: const Size(50,50)),
                             ), 
                            const Text('Get Your Data/Link to the QR CODE ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: TextField(
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                controller: qrText,
                                // ignore: prefer_const_constructors
                                decoration: InputDecoration(
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
                                    if(qrText.text.isEmpty){
                                      setState(() {
                                        qrData = "https://flutter.dev";
                                      });   
                                    }else{
                                     setState(() {
                                        qrData = qrText.text;
                                     });  
                                    }
                                    print("qrcodeData: ${qrData}");
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

  final idText = TextEditingController();
  final nameText = TextEditingController();
}

class DatasUserQrcode {
  String id = '';
  String name ='';
  String desination = '';
  DatasUserQrcode({required this.desination, required this.id, required this.name});
}