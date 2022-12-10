import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/addEmployee.dart';
import 'package:flutter_application_1/Admin/Home/eddSuc.dart';
import 'package:flutter_application_1/Admin/Home/employeeList.dart';
import 'package:flutter_application_1/Admin/Home/employeeManagement.dart';

class EmptyEmployee extends StatefulWidget {
  const EmptyEmployee({super.key});

  @override
  State<EmptyEmployee> createState() => _EmptyEmployeeState();
}
 final docId =[];//// k có cho commit file len 
class _EmptyEmployeeState extends State<EmptyEmployee> {
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
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 62),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EmployeeManagement()));
                              }),
                              icon: const Icon(Icons.arrow_back),
                              color: const Color(0xffFFFFFF),
                            ),
                            const Text(
                              'Empty Employee',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontFamily: 'Manrope',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 124,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                      width: 375,
                      height: 688,
                      decoration: const BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              // fit: BoxFit.cover,
                              width: 294,
                              height: 226,
                            image: AssetImage('Image/ImageEmpty.png'),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text('No Data',
                                  style: TextStyle(
                                      color: Color(0xff22215B),
                                      fontFamily: 'Manrope',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 2),
                              child: Text('Add your employee',
                                  style: TextStyle(
                                      color: Color(0xff9090AD),
                                      fontFamily: 'Manrope',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 34, left: 291, bottom: 0, top: 0),
                              child: FloatingActionButton(
                                backgroundColor: const Color(0xff567DF4),
                                onPressed: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const AddEmployee()));
                                }),
                                child: const SizedBox(
                                  width: 100, height: 100,
                                  child: Icon(
                                    Icons.add,
                                    
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 53,
                              width: 300,
                              child: ElevatedButton(
                                onPressed: (() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddSuccess()));
                                }),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color(
                                            0xff567DF4),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius
                                                .circular(
                                                    10))),
                                child: const Text(
                                  textAlign: TextAlign.center,
                                  'Employee List',
                                  style: TextStyle(
                                      color: Color(
                                          0xffFFFFFF),
                                      fontFamily:
                                          'Manrope',
                                      fontSize:
                                          14,
                                      fontWeight:
                                          FontWeight
                                              .bold),
                                )),
                            ),
                          ],
                        ),
                      ))),
                       Padding(
                        padding: const EdgeInsets.only(top: 620, bottom: 0, left: 121, right: 121),
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
          )),
        ],
      ),
    );
  }
}
