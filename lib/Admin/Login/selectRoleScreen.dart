import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Login/SignIn/login/widget_tree_admin.dart';
import 'package:flutter_application_1/Admin/Login/SignUp/signUpAdminHR.dart';
import 'package:flutter_application_1/User/Login/Home/signInUpUser/widget_tree_user.dart';



class SelectRole extends StatefulWidget {
  const SelectRole({super.key});

  @override
  State<SelectRole> createState() => _SelectRoleState();
}

const BackGrColor = Color(0xffFFECEE);
const BottomColor = Color(0xffFFE1E4);
const BackGrColorFul = Color(0xffD6E3FF);

class _SelectRoleState extends State<SelectRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 400,
          height: 800,
          color: BackGrColorFul,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      right: 228,
                      left: -60,
                      bottom: 550,
                      child: Container(
                        width: 207,
                        height: 212,
                        // color: BackGrColor,
                      ),
                    ),
                    Positioned(
                        top: 176,
                        left: 246,
                        child: Container(
                          // color: BackGrColor,
                          width: 258,
                          height: 211,
                        )),
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 92, left: 128, right: 128),
                      child: Image(
                        image: AssetImage('Image/Logo.png'),
                        width: 119,
                        height: 69,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 48, right: 48, top: 180 ),
                      child: Image(
                        image: AssetImage('Image/ImageRole.png'),
                        width: 278.65,
                        height: 199.97,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 380, left: 102),
                      child: Text(
                        'Select Your Role',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 22,
                            color: Color(0xff22215B),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 420, left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 76,
                            width: 327,
                            child: ElevatedButton(
                                onPressed: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               const WidgetTreeAdmin()));
                                }),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffFFFFFF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Image(
                                      image: AssetImage('Image/Admin1.png'),
                                      // color: Color(0xff3F3679),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(right: 28),
                                          child: Text(
                                            'Business Owner / Admin / HR',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff22215B),
                                                fontSize: 16),
                                          ),
                                        ),
                                        Text(
                                          'Register your company & start attendance ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff9090AD),
                                              fontSize: 13),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 80,
                            width: 327,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 0, right: 0, bottom: 0),
                              child: ElevatedButton(
                                  onPressed: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 const WidgetTreeUser()));
                                  }),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffFFFFFF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Image(
                                          image: AssetImage('Image/business.png')),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 180),
                                            child: Text(
                                              'Employee',
                                              style: TextStyle(
                                                  color: Color(0xff22215B),
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Text(
                                            'Register and start marking your attendance',
                                            style: TextStyle(
                                                color: Color(0xff9090AD),
                                                fontSize: 13),
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Container(
                width: 134,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xff9090AD),
                  // border: Border.all(
                  //     color: Colors.white,
                  //     width: 1,
                  //     style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(100),
                ),
                ),
              )
            ],
          )),
    );
  }
}
