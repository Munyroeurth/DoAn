import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/addEmployee.dart';
import 'package:flutter_application_1/Admin/Home/employeeList.dart';

class AddSuccess extends StatefulWidget {
  const AddSuccess({Key? key}) : super(key: key);

  @override
  State<AddSuccess> createState() => _AddSuccess();
}
 final docId =[];//// k có cho commit file len 
class _AddSuccess extends State<AddSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                    width: 700,
                    height: 700,
                    color: const Color(0xff567DF4),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 44),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const AddEmployee()));
                                }),
                                icon: const Icon(Icons.arrow_back),
                                color: const Color(0xffFFFFFF),
                              ),
                              const Text('Employee Added Successfully',
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontFamily: 'Manrope',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  top: 124,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                      width: 700,
                      height: 700,
                      decoration: const BoxDecoration(
                          color: Color(0xffFAFAFA),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      // sizeBox(height:24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Container(
                                width: 327,
                                height: 112,
                                decoration: BoxDecoration(
                                    color: Color(0xffFFFFFF),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 24),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            'Please download app form Playstore',
                                            style: TextStyle(
                                                color: Color(0xff22215B),
                                                fontFamily: 'Manrope',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Please clicking on the below link:',
                                            style: TextStyle(
                                                color: Color(0xff9090AD),
                                                fontFamily: 'Manrope',
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'httpl://bit.ly/hryu3a',
                                            style: TextStyle(
                                                color: Color(0xff567DF4),
                                                fontFamily: 'Manrope',
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          /***********ROw2**********/
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Container(
                                width: 327,
                                height: 112,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFFFFFF),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 24),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            'Employee Login detailes',
                                            style: TextStyle(
                                                color: Color(0xff22215B),
                                                fontFamily: 'Manrope',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'User: ',
                                            style: TextStyle(
                                                color: Color(0xff22215B),
                                                fontFamily: 'Manrope',
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '+1452 4521 5412 ',
                                            style: TextStyle(
                                                color: Color(0xff9090AD),
                                                fontFamily: 'Manrope',
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Password: ',
                                            style: TextStyle(
                                                color: Color(0xff22215B),
                                                fontFamily: 'Manrope',
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'D5z145destg',
                                            style: TextStyle(
                                                color: Color(0xff9090AD),
                                                fontFamily: 'Manrope',
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          /******Button*****/
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: SizedBox(
                              width: 327,
                              height: 54,
                              child: ElevatedButton(
                                  onPressed: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EmployeeList()));
                                  }),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff567DF4),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: const Text(
                                    'Share Details With Employee',
                                    style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontFamily: 'Manrope',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ],
                      )),
                    ),
                   Padding(
                  padding: const EdgeInsets.only(top: 620, bottom: 8, left: 121, right: 121),
                  child: Container(
                    width: 134,
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xff9090AD),
                      border: Border.all(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius:
                          BorderRadius.circular(100),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
