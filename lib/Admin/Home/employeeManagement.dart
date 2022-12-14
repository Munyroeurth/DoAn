import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/EmptyEmployee.dart';
import 'package:flutter_application_1/Admin/Home/HRMScreen.dart';
import 'package:flutter_application_1/Admin/Home/emplyeeattendlist.dart';

class EmployeeManagement extends StatefulWidget {
  const EmployeeManagement({super.key});

  @override
  State<EmployeeManagement> createState() => _EmployeeManagementState();
}

class _EmployeeManagementState extends State<EmployeeManagement> {
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
                    color: Color(0xff567DF4),
                  ),
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
                                                const HRMScreen()));
                                  }),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                              const Text(
                                'Employee Management',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                    fontFamily: 'Manrope',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 128,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                        height: 124,
                        decoration: const BoxDecoration(
                            color: Color(0xffFAFAFA),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Column(children: [
                            /*******Add Employee******** */
                            Container(
                              height: 56,
                              width: 327,
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(
                                children: [
                                  Container(
                                    height: 56,
                                    width: 4,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff9C8CFD),
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
                                            color: const Color.fromARGB(
                                                255, 195, 187, 245),
                                            // border:Border.all(color: Color(0xff80DDFE), width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: TextButton(
                                          onPressed: (() {}),
                                          child: const Image(
                                              image: AssetImage(
                                                  'Image/youth.png')),
                                        )),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 12, top: 16, bottom: 16),
                                    child: Text(
                                      'Add Employee',
                                      style: TextStyle(
                                        color: Color(0xff22215B),
                                          fontFamily: 'Manrope',
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 105, top: 7, bottom: 10),
                                    child: IconButton(
                                        onPressed: (() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EmptyEmployee()));
                                        }),
                                        icon: const Icon(
                                            Icons.arrow_forward_ios_outlined),
                                        color: const Color(
                                          0xff9090AD,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            /***********Time Attendance*********/
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
                                          color: Color(0xffFF99C7),
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
                                              color: const Color(0xffFF99C7),
                                              // border:Border.all(color: Color(0xff80DDFE), width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: TextButton(
                                            onPressed: (() {}),
                                            child: const Image(
                                                image: AssetImage(
                                                    'Image/immigration.png')),
                                          )),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 12, top: 16, bottom: 16),
                                      child: Text(
                                        'Time Attendance',
                                        style: TextStyle(
                                          color: Color(0xff22215B),
                                            fontFamily: 'Manrope',
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 80, top: 7, bottom: 10),
                                      child: IconButton(
                                          onPressed: (() {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeAttenList()));
                                          }),
                                          icon: const Icon(
                                              Icons.arrow_forward_ios_outlined),
                                          color: const Color(
                                            0xff9090AD,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            /******Leave Management******/
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
                                          color: Color(0xffFFD84D),
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
                                              color: Color(0xffFFD84D),
                                              // border:Border.all(color: Color(0xff80DDFE), width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: TextButton(
                                            onPressed: (() {}),
                                            child: const Image(
                                                image: AssetImage(
                                                    'Image/exit.png')),
                                          )),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 12, top: 16, bottom: 16),
                                      child: Text(
                                        'Leave Management',
                                        style: TextStyle(
                                          color: Color(0xff22215B),
                                            fontFamily: 'Manrope',
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 60, top: 7, bottom: 10),
                                      child: IconButton(
                                          onPressed: (() {}),
                                          icon: const Icon(
                                              Icons.arrow_forward_ios_outlined),
                                          color: const Color(
                                            0xff9090AD,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            /****Employe Overtime*****/
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
                                              bottomLeft: Radius.circular(10))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14, top: 8, bottom: 8),
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 250, 212, 177),
                                              // border:Border.all(color: Color(0xff80DDFE), width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: TextButton(
                                            onPressed: (() {}),
                                            child: const Image(
                                                image: AssetImage(
                                                    'Image/workingtime.png')),
                                          )),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 12, top: 16, bottom: 16),
                                      child: Text(
                                        'Employee Overtime',
                                        style: TextStyle(
                                          color: Color(0xff22215B),
                                            fontFamily: 'Manrope',
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 62, top: 7, bottom: 10),
                                      child: IconButton(
                                          onPressed: (() {}),
                                          icon: const Icon(
                                              Icons.arrow_forward_ios_outlined),
                                          color: const Color(
                                            0xff9090AD,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            /************* */
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
                                          color: Color(0xffFF99C7),
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
                                              color: const Color.fromARGB(
                                                  255, 255, 203, 227),
                                              // border:Border.all(color: Color(0xff80DDFE), width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: TextButton(
                                            onPressed: (() {}),
                                            child: const Image(
                                                image: AssetImage(
                                                    'Image/salary.png')),
                                          )),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 12, top: 16, bottom: 16),
                                      child: Text(
                                        'Salary Statement',
                                        style: TextStyle(
                                          color: Color(0xff22215B),
                                            fontFamily: 'Manrope',
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 80, top: 7, bottom: 10),
                                      child: IconButton(
                                          onPressed: (() {}),
                                          icon: const Icon(
                                              Icons.arrow_forward_ios_outlined),
                                          color: const Color(
                                            0xff9090AD,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            /*********Reference ******/
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Container(
                                  width: 327,
                                  height: 56,
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFFFFF),
                                      border: Border.all(
                                          color: Color(0xffFFFFFF), width: 1),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 56,
                                        width: 4,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff57DB93),
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
                                                    255, 194, 245, 228),
                                                // border:Border.all(color: Color(0xff80DDFE), width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: TextButton(
                                              onPressed: (() {}),
                                              child: const Image(
                                                  image: AssetImage(
                                                      'Image/referral.png')),
                                            )),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 12, top: 16, bottom: 16),
                                        child: Text(
                                          'Reference',
                                          style: TextStyle(
                                            color: Color(0xff22215B),
                                              fontFamily: 'Manrope',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 125, top: 21, bottom: 10),
                                        child: IconButton(
                                          onPressed: (() {}),
                                          icon: const Icon(
                                              Icons.arrow_forward_ios_rounded),
                                          color: const Color(0xff9090AD),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            
                            // Padding(
                            //     padding: const EdgeInsets.only(top: 50),
                            //     child: Container(
                            //       width: 134,
                            //       height: 5,
                            //       decoration: BoxDecoration(
                            //         color: const Color(0xff9090AD),
                            //         border: Border.all(
                            //             color: Colors.white,
                            //             width: 1,
                            //             style: BorderStyle.solid),
                            //         borderRadius: BorderRadius.circular(100),
                            //       ),
                            //     ),
                            //   )
                          ]),
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
