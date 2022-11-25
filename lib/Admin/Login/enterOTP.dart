import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/hRMScreen.dart';
import 'package:flutter_application_1/Admin/Login/ForgetPass.dart';
import 'package:flutter_application_1/Admin/Login/SignUp/signUpAdminHR.dart';

class EnterOTP extends StatefulWidget {
  const EnterOTP({super.key});

  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

const BackgrnColor = Color(0xff567DF4);
const ColorOTP = Color(0xffFF8919);

class _EnterOTPState extends State<EnterOTP> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Stack(
          children: [
            Container(
              width: 700,
              height: 800,
              color: BackgrnColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 61),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPassSreen()));
                            }),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        const Text(
                          'Enter OTP',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Manrope',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 19),
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adip iscing elit.',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Manrope',
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  )
                ],
              ),
            ),
            Positioned(
              top: 152,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  // height: size.height * 0.2 - 27,
                  height: 200,
                  width: 375,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36))),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24, left: 24),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                          ),
                          child: Container(
                            height: 50,
                            width: 327,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 249, 166, 207),
                                // color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 10,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)
                                    )
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    'OTP Input',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 34, 5, 140),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Container(
                            width: 327,
                            height: 70,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              children: [
                              Container(
                                width: 42,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                  color: const Color(0xff22215B),
                                  width: 1,
                                  style: BorderStyle.solid),
                                  color: const Color(0xffFAFAFA),
                                  borderRadius: BorderRadius.circular(10)
                                )
                               ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Container(
                                  width: 42,
                                  height: 50,
                                  decoration: BoxDecoration(
                                     border: Border.all(
                                     color: const Color(0xff22215B),
                                     width: 1,
                                     style: BorderStyle.solid),
                                    color: const Color(0xffFAFAFA),
                                    borderRadius: BorderRadius.circular(10)
                                  )
                               ),
                                ),
                                Container(
                                width: 42,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                  color: const Color(0xff22215B),
                                  width: 1,
                                  style: BorderStyle.solid),
                                  color: const Color(0xffFAFAFA),
                                  borderRadius: BorderRadius.circular(10)
                                )
                               ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 10),
                                  child: Container(
                                  width: 42,
                                  height: 50,
                                  decoration: BoxDecoration(
                                     border: Border.all(
                                     color: const Color(0xff22215B),
                                     width: 1,
                                     style: BorderStyle.solid),
                                    color: const Color(0xffFAFAFA),
                                    borderRadius: BorderRadius.circular(10)
                                  )
                               ),
                                ),
                                Container(
                                width: 42,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                  color: const Color(0xff22215B),
                                  width: 1,
                                  style: BorderStyle.solid),
                                  color: const Color(0xffFAFAFA),
                                  borderRadius: BorderRadius.circular(10)
                                )
                               ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10, left: 10),
                                  child: Container(
                                  width: 42,
                                  height: 50,
                                  decoration: BoxDecoration(
                                  border: Border.all(
                                  color: const Color(0xff22215B),
                                  width: 1,
                                  style: BorderStyle.solid),
                                    color: const Color(0xffFAFAFA),
                                    borderRadius: BorderRadius.circular(10)
                                  )
                               ),
                                )
                              ],
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 24, left: 91, right: 92),
                          child: SizedBox(
                              width: 152,
                              height: 42,
                              child: ElevatedButton(
                                  onPressed: (() {}),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromARGB(255, 227, 227, 231),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6))),
                                  child: const Text(
                                    'Resend OTP',
                                    style: TextStyle(
                                        color: Color(0xff22215B),
                                        fontFamily: 'Manrope',
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal),
                                    textAlign: TextAlign.center,
                                  ))),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 12,
                            // left: 84, right: 85
                          ),
                          child: Text(
                            'You can request OTP after 01:52',
                            style: TextStyle(
                                color: ColorOTP,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Manrope',
                                fontSize: 14,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                            //  left: 24, right: 24
                          ),
                          child: SizedBox(
                            height: 54,
                            width: 327,
                            child: ElevatedButton(
                              onPressed: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignInHR()));
                              }),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: BackgrnColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              child: const Text('Verify'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 120),
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
                    ),
                  )
                  ),
            )
          ],
        )),
      ],
    ));
  }
}
