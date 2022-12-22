import 'dart:math';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../../../Admin/Login/SignIn/login/auth.dart';
import 'homeqrcodeScreen.dart';
class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {

  final controllerqrcodeData = TextEditingController();

  String qrcodeResult = "Unknow";
  
  final User? user = Auth().currentUser;

  Future<void> postDataQrcode() async {
    await Auth().postDataQrcode();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Expanded(
              child: Stack(children: [
                Container(
                height: 800,
                width: 800,
                decoration: const BoxDecoration(
                  color: Color(0xff567DF4),
                ),
                 child: Padding(
                   padding: const EdgeInsets.only(top: 50,),
                   child: Column(
                     children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: IconButton(
                              onPressed: (() {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const QrCodeScreen()));
                              }),
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Text(
                            'Scan QR Code',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 145),
                        child: Text('Chấm công cho tiền của bạn không hè SAI',
                         style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Manrope',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal),),
                      )
                     ],
                   ),
                 ),
              ),
              Positioned(
                top: 123,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: 356,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    ) ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                    children: [
                      Container(
                        height: 53,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: [
                          const CircleAvatar(backgroundColor: Colors.deepPurple, child: Text('M'),),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(user?.email?? 'Email'),
                          )
                          ],
                        ),
                      ),
                      const Text('RESUALT CHẤM CÔNG CỦA BẠN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),),
                        Padding(
                          padding:  const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration:  BoxDecoration(
                              boxShadow:[ BoxShadow(color: Color.fromARGB(255, 196, 216, 244).withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0,2))],
                            color: const Color.fromARGB(255, 230, 222, 222),
                            borderRadius:BorderRadius.circular(10)),
                            child: Column(
                              children: [
                              Padding(
                              padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
                              child: Text(qrcodeResult,
                              textAlign: TextAlign.center, 
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15),),
                              ),
                              ],
                            ),
                            ),
                          ),
                          //***************CHECK IN******** */
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                          height: 54,
                          width: 280,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: (() {
                              Map<String,dynamic> dataqrcode = {"qrcodeLink":qrcodeResult};
                              FirebaseFirestore.instance
                              .collection('Employee')
                              .doc('ujWkGkMi4WnTFMmrLdoG')
                              .update(dataqrcode);

                              ScanBarcode();
                              print('ScanBarcode ${ScanBarcode}');

                              
                            }),
                           
                            child: const Text('Check In'),
                          ),
                        ),
                        ),
                        //*************CHECK OUT*******/
                         Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                          height: 54,
                          width: 280,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: (() {
                              Map<String,dynamic> dataqrcode = {"qrcodeLink":qrcodeResult};
                              FirebaseFirestore.instance
                              .collection('Employee')
                              .doc('ujWkGkMi4WnTFMmrLdoG')
                              .update(dataqrcode);

                              ScanBarcode();
                              print('ScanBarcode ${ScanBarcode}');
                             
                            }),
                            child: const Text('Check Out'),
                          ),
                        ),
                        ),
                        // ButtonWidget(text : )
                   ]),
                  ),
                 )
                ),
              ]
            )
          )),
        ],
      ),
    );
  }
  void ScanBarcode() async {
   try {
    final qrcodeResult = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666", "Cancel", true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        this.qrcodeResult = qrcodeResult;
      });
      print('qrcodeResultaa $qrcodeResult');
   } on PlatformException {
    qrcodeResult = 'Failed to get platform version';
   }
  }

 
}
