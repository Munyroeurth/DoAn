import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/User/Login/Home/HRMUser.dart';
import 'package:flutter_application_1/User/Login/Home/qrcode/generate.dart';
import 'package:flutter_application_1/User/Login/Home/qrcode/generateQrcodeValue.dart';
import 'package:flutter_application_1/User/Login/Home/qrcode/loginQrcode/loginscreen.dart';
import 'package:flutter_application_1/User/Login/Home/qrcode/scan.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  var getResult = 'QR Code Result';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: 800,
                  height: 800,
                  color: Color(0xff567DF4),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 44),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(),
                              child: IconButton(
                                onPressed: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HRMUserScreen()));
                                }),
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Text(
                                'QRCode Scan',
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily: 'Manrope',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 124,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        // width: 375,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Color(0xffFAFAFA),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              const Image(image: AssetImage('Image/chamconglogo.png'), width: 200, height: 200,),
                              SizedBox(
                                height: 54,
                                width: 300,
                                child: ElevatedButton(        
                                  // child: const Scan(),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                    )
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Scan()));
                                  },
                                  child: const Text('SCAN QR CODE '),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  height: 54,
                                  width: 300,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                    onPressed: () {
                                    
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const generate()));
                                    },
                                    child: const Text('SCAN QR CODE GENERETE'),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed:(() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                                }) , child: const Text('Nhan Dang Test')),
                              TextButton(onPressed: (() => Navigator.push(context, MaterialPageRoute(builder: (context)=>BooingQRGenerate(abid: 1, uid: 2, txnid: 3)))), 
                              child: Text('GENERETE QRCODE WITH 3 VALUE'))
                            ],
                          ),
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*****Xay Dung ham Sceen Code********/
void ScanQRCode() async {
  try {
    final qrcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE);

    if (!mounted) return;
    
    setState(() {
      getResult = qrcode;
    });
    print("QRCode_Result:--");
    print(qrcode);
  } on PlatformException {
    getResult = 'Faild to Scan QrCode';
  }
}

}

