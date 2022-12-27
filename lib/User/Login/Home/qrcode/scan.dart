import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Admin/Home/addEmployee.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../../../Admin/Login/SignIn/login/auth.dart';
import 'homeqrcodeScreen.dart';
import 'package:intl/intl.dart';
class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {


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
                            height: 220,
                            width: 500,
                            decoration:  BoxDecoration(
                              boxShadow:[
                              BoxShadow(color: const Color.fromARGB(255, 196, 216, 244).withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0,2))],
                            color: const Color.fromARGB(255, 248, 246, 246),
                            borderRadius:BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                Container(
                                  height: 90,
                                  width: 400,
                                  decoration:  BoxDecoration(
                                  color: const Color(0xffFAFAFA),
                                  borderRadius:BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  const [
                                            Text('Working Day',style: TextStyle(fontSize: 13),),
                                            Text('Check In',style: TextStyle(fontSize: 13),),
                                            Text('Check Out',style: TextStyle(fontSize: 13),),
                                          ],
                                        ),
                                       
                                        Container(height: 2, color: Colors.black,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text('TimeDate',style: TextStyle(fontSize: 13),),
                                            Text('Check In:00:00',style: TextStyle(fontSize: 13),),
                                            Text('Check Out:00:00',style: TextStyle(fontSize: 13),),
                                            // Text('Check Out:$todayDate'),
                                         
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: 100,
                                    width: 400,
                                    decoration:  BoxDecoration(
                                    color: const Color(0xffFAFAFA),
                                    borderRadius:BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text('Email'),
                                            Text('ID')
                                          ],
                                         ),
                                         Container(height: 2,color: Colors.black,),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(qrcodeemail??'',
                                            textAlign: TextAlign.center, 
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),),
                                            Text(qrcodeId??'',
                                            textAlign: TextAlign.center, 
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),),
                                            ],
                                          )
                                         ],
                                        ),
                                      ),
                                    ),
                                ),
                                ],
                                ),
                            ),
                            ),
                          ),
                          //***************CHECK IN******** */
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
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
                              // ScanBarcode();
                              todayDate();
                              // print('ScanBarcode ${ScanBarcode}'); 
                              print('Check In: ${todayDate}');
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
                            onPressed: (()async{
                              
                              // ScanBarcode();
                              todayDate();
                              print('ScanBarcode: ${ScanBarcode}');
                              print('Check OUT: ${todayDate}');
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

  String? qrcodeId = 'UnKnow';  
  String? qrcodeemail = 'Unknow';  
  
  Future<List<AddNhanVien?>> ScanBarcode() async {
    List<AddNhanVien?> userJson = [];
    try {
    // final res = await FirebaseFirestore.instance.collection('AddNhanvien').get().
    // then((value) => 
    // value.docs.map((e) => {
    //   AddNhanVien.fromJson(e.data()),
    //   userJson.add(AddNhanVien.fromJson(e.data()),)
    //   // (AddNhanVien.fromJson(e.data()),)
    // }).toList());
    qrcodeId = "${user?.uid}";
    qrcodeemail = "${user?.email}${user?.displayName}";

    final qrcodeResult = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666", "Cancel", true, ScanMode.QR).then((value) => {
        qrcodeId,qrcodeemail,
      });
      // if (!mounted) {
      // }
      setState(() {
        qrcodeId = qrcodeId!;
        qrcodeemail = qrcodeemail!;
        // this.qrcodeResult = qrcodeResult!;
        todayDate();
      });
      print('qrcodeResult: $qrcodeResult');
   } on PlatformException {
     qrcodeResult = 'Failed to get platform version';
   }
   return userJson;
  } 
  /*******Time Check in hay Out*****************/

  String? timeIn = 'Unknow';
  String? timeOut = 'Unknow';
 
  // List<AddNhanVien?> 
  todayDate() {
    qrcodeId = "${user?.uid}";
    qrcodeemail = "${user?.email}${user?.displayName}";

    var now =  DateTime.now();
    var formatter =  DateFormat('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm:a').format(now);
    String formattedDate = formatter.format(now);

    print(formattedTime);
    print(formattedDate);

    // setState(() {
    //   timeIn = timeIn;
    //   timeOut = timeOut!;
    // });
  }
  
}
