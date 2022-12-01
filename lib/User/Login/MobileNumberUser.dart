import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/User/Login/Home/HRMUser.dart';
import 'package:flutter_application_1/User/Login/signUpUser.dart';

class MobileOTPUser extends StatefulWidget {
  const MobileOTPUser({super.key});

  @override
  State<MobileOTPUser> createState() => _MobileOTPUserState();
}
const BackgrnColor = Color(0xff567DF4);
const ColorOTP = Color(0xff22215B);
final countryPicker = const FlCountryCodePicker();
class _MobileOTPUserState extends State<MobileOTPUser> {
  //  Size size = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            // height: size.height * 0.2,
            child: Stack(
          children: [
            Container(
              width: 400,
              height: 600,
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
                                          const SignUpUser()));
                            }),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        const Text(
                          'Mobile Number Verify',
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
                        'Enter the 6 digit code sent to your mobile number',
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
                  height: 5,
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
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              children: [
                              Container(
                                width: 42,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                  color: Color(0xff22215B),
                                  width: 1,
                                  style: BorderStyle.solid),
                                  color: Color(0xffFAFAFA),
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
                                     color: Color(0xff22215B),
                                     width: 1,
                                     style: BorderStyle.solid),
                                    color: Color(0xffFAFAFA),
                                    borderRadius: BorderRadius.circular(10)
                                  )
                               ),
                                ),
                                Container(
                                width: 42,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                  color: Color(0xff22215B),
                                  width: 1,
                                  style: BorderStyle.solid),
                                  color: Color(0xffFAFAFA),
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
                                     color: Color(0xff22215B),
                                     width: 1,
                                     style: BorderStyle.solid),
                                    color: Color(0xffFAFAFA),
                                    borderRadius: BorderRadius.circular(10)
                                  )
                               ),
                                ),
                                Container(
                                width: 42,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                  color: Color(0xff22215B),
                                  width: 1,
                                  style: BorderStyle.solid),
                                  color: Color(0xffFAFAFA),
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
                                  color: Color(0xff22215B),
                                  width: 1,
                                  style: BorderStyle.solid),
                                    color: Color(0xffFAFAFA),
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
                                          Color.fromARGB(255, 237, 237, 246),
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
                                color: Color(0xffFF8919),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Manrope',
                                fontSize: 16,
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
                                        builder: (context) => const HRMUserScreen()));
                              }),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: BackgrnColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              child: const Text('Verify'),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
               ),
               Padding(
                padding: const EdgeInsets.only(top: 630, left: 121, right: 121, bottom: 4),
                child: Container(
                width: 134,
                height: 5,
                decoration: BoxDecoration(
                  color: Color(0xff9090AD),
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
      ],
    ));
  }
}