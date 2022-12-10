import 'package:flutter/material.dart';
import 'package:flutter_application_1/FirebaseTest/firesbase/editthongtinnhanvienFB.dart';

import 'package:flutter_application_1/FirebaseTest/otp/phone.dart';

import 'HRMUser.dart';

class PhieuLuong extends StatefulWidget {
  const PhieuLuong({super.key});

  @override
  State<PhieuLuong> createState() => _PhieuLuongState();
}

class _PhieuLuongState extends State<PhieuLuong> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Container(
                  width: 800,
                  height: 800,
                  decoration: const BoxDecoration(
                    color: Color(0xff567DF4),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 44),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(),
                                    child: IconButton(
                                      onPressed: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HRMUserScreen()));
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
                                      'Phiếu chi lương',
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  top: 124,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 375,
                    height: 688,
                    decoration: const BoxDecoration(
                        color: Color(0xffFAFAFA),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: (() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const FiresBaseSetup()));
                            }),
                            child:Text('Edit Thong tin nhan vien') ),
                            ElevatedButton(
                            onPressed: (() {
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> WidgetTreeAdmin()));
                            }),
                            child:Text('Sign In Email My Widget') ),
                            ElevatedButton(
                            onPressed: (() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Myphone()));
                            }),
                            child:Text('otp') ),
                          
                            
                        ],
                      ),
                    ),
                            
                  ))
            ],
          )),
        ],
      ),
    );
  }
}
 final docId =[];//// k có cho commit file len 