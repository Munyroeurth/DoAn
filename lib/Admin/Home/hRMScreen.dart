import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/employeeManagement.dart';
import 'package:flutter_application_1/Admin/Login/SignIn/login/auth.dart';


class HRMScreen extends StatefulWidget {
  const HRMScreen({super.key});

  @override
  State<HRMScreen> createState() => _HRMScreenState();
}
 final docId =[];//// k có cho commit file len 
const BackgrnColor = Color(0xff567DF4);

class _HRMScreenState extends State<HRMScreen> {

   final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }
  Future<void> edit() async {
    await Auth().edit();
  }

   Widget _AdminNam() {
    return Text(user?.email ?? 'User Email', style: const TextStyle(fontSize: 10),);
  }
  Widget _signOutButton() {
    return SizedBox(
      height: 50,
      width: 320,
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        // minimumSize: Size(327, 54),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10))),
        onPressed: signOut,
        child: const Text('Sign Out', style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal, color: Colors.white, fontFamily: 'Manrope'),),
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                    width: 375,
                    height: 812,
                    decoration: const BoxDecoration(
                      color: BackgrnColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 44),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                          color: Colors.white10,
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(10))),
                                      child: IconButton(
                                          onPressed: (() {}),
                                          icon: const Icon(
                                            Icons.menu,
                                            color: Colors.white,
                                          )),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Text(
                                        'HRM& \nPayroll Managerment',
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
                              Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  child: IconButton(
                                    onPressed: (() {}),
                                    icon:
                                        const Icon(Icons.notifications_none_outlined),
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                Positioned(
                    top: 128,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                        width: 200,
                        height: 300,
                        decoration: const BoxDecoration(
                            color: Color(0xffFAFAFA),
                            // border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        /******BODY******** */
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /********BODY1**********/
                                    Container(
                                        width: 135,
                                        height: 128,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // border: Border.all(
                                          //     color: Colors.grey, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 128,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff9E8EFE),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            /******EmPloyee Management*****/
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                                top: 16,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xff9E8EFE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                      child: TextButton(
                                                          onPressed: (() {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const EmployeeManagement()));
                                                          }),
                                                          child: const Image(
                                                              image: AssetImage(
                                                                  'Image/business.png'))),
                                                    ),
                                                  ),
                                                   Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 16, top: 12),
                                                    child:Column(
                                                      children: [
                                                        Text('Đỗ Thu Trang', ),
                                                        _AdminNam(),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                    /********BODY1**********/
                                    Container(
                                        width: 135,
                                        height: 128,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // border: Border.all(
                                          //     color: Colors.grey, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 128,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xffFD72AF),
                                                  // border: Border.all(color: Colors.grey, width: 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            /********HRM*****/
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                                top: 16,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xffFD73B0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                      child: TextButton(
                                                          onPressed: (() {}),
                                                          child: const Image(
                                                              image: AssetImage(
                                                                  'Image/calculator.png'))),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16, top: 12),
                                                    child: Text(
                                                      'Expenses\nManagement',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: Color(0xff22215B),
                                                          fontFamily: 'Manrope',
                                                          fontSize: 16,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              /******BODY2*******/
                              Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /********BODY2**********/
                                    Container(
                                        width: 135,
                                        height: 128,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // border: Border.all(
                                          //     color: Colors.grey, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 128,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff4ACDF9),
                                                  // border: Border.all(color: Colors.grey, width: 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                                top: 16,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xff4CCEFA),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                      child: TextButton(
                                                          onPressed: (() {}),
                                                          child: const Image(
                                                              image: AssetImage(
                                                                  'Image/receipt.png'))),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16, top: 12),
                                                    child: Text(
                                                      'Payroll\nManagement',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: Color(0xff22215B),
                                                          fontFamily: 'Manrope',
                                                          fontSize: 16,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                    /********BODY2**********/
                                    Container(
                                        width: 135,
                                        height: 128,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // border: Border.all(
                                          //     color: Colors.grey, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 128,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff02B984),
                                                  // border: Border.all(color: Colors.grey, width: 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                            Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                                top: 16,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xff04B985),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                      child: TextButton(
                                                          onPressed: (() {}),
                                                          child: const Image(
                                                              image: AssetImage(
                                                                  'Image/folder.png'))),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16, top: 12),
                                                    child: Text(
                                                      'File\nManagement',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: Color(0xff22215B),
                                                          fontFamily: 'Manrope',
                                                          fontSize: 16,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))),
                Positioned(
                    top: 450,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            color: const Color(0xffFAFAFA),
                            border: Border.all(color: Colors.white, width: 0),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        /*****BODY CLIENT******/
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child:ListView(
                            children:[ Column(
                              children: [
                                /*******Client Management******** */
                                Container(
                                  height: 56,
                                  width: 327,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFFFFF),
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 56,
                                        width: 4,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff80DDFE),
                                            // border:Border.all(color: Color(0xff80DDFE), width: 1),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 14, top: 8, bottom: 8),
                                        child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff80DDFE),
                                                // border:Border.all(color: Color(0xff80DDFE), width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: TextButton(
                                              onPressed: (() {}),
                                              child: const Image(
                                                  image: AssetImage(
                                                      'Image/business.png')),
                                            )),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 12, top: 16, bottom: 16),
                                        child: Text(
                                          'Client Management',
                                          style: TextStyle(
                                            color: Color(0xff22215B),
                                              fontFamily: 'Manrope',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 64, top: 7, bottom: 10),
                                        child: IconButton(
                                            onPressed: (() {}),
                                            icon: const Icon(
                                                Icons.arrow_forward_ios_outlined),
                                            color: const Color(0xff9090AD,)),
                                      )
                                    ],
                                  ),
                                ),
                                /***********NOC/Ex Certificate*********/
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Container(
                                    height: 56,
                                    width: 327,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFFFFFF),
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 56,
                                          width: 4,
                                          decoration: const BoxDecoration(
                                              color: Color(0xffFFAB5A),
                                              // border:Border.all(color: Color(0xff80DDFE), width: 1),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 14, top: 8, bottom: 8),
                                          child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 241, 177, 117),
                                                  // border:Border.all(color: Color(0xff80DDFE), width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: TextButton(
                                                onPressed: (() {}),
                                                child: const Image(
                                                    image: AssetImage(
                                                        'Image/Group.png')),
                                              )),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 12, top: 16, bottom: 16),
                                          child: Text(
                                            'NOC/Ex Certificate',
                                            style: TextStyle(
                                              color: Color(0xff22215B),
                                                fontFamily: 'Manrope',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 64, top: 7, bottom: 10),
                                          child: IconButton(
                                              onPressed: (() {}),
                                              icon: const Icon(Icons
                                                  .arrow_forward_ios_outlined),
                                              color: const Color(0xff9090AD,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: _signOutButton(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 27),
                                  child: Container(
                                    width: 134,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff9090AD),
                                      border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ]),
                        ))
                   )
                 ],
            ),
          )
        ],
      ),
    );
  }
}
