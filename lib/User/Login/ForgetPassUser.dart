import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/User/Login/MobileNumberUser.dart';
import 'package:flutter_application_1/User/Login/signUpUser.dart';

class ForgetPassUser extends StatefulWidget {
  const ForgetPassUser({super.key});

  @override
  State<ForgetPassUser> createState() => _ForgetPassUserState();
}
const BackgrnColor = Color(0xff567DF4);
class _ForgetPassUserState extends State<ForgetPassUser> {
  String tittle = 'Country Code Picker';
   final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
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
              height: 400,
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
                          'Forget Password',
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
                    padding: EdgeInsets.only(right: 80),
                    child: Text('Lorem ipsum dolor sit amet, consectetur.',
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
                  height: 10,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36))),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 23, top: 43, right: 25),
                        child:   Padding(
                              padding: const EdgeInsets.only(top: 26),
                              child: TextField(
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                // maxLength: 10,
                                decoration: InputDecoration(
                                    prefixIcon: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 3),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                              onTap: () async {
                                                final code = await countryPicker
                                                    .showPicker(
                                                        context: context);
                                                setState(() {
                                                  countryCode = code;
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 21,
                                                    width: 32,
                                                    child: countryCode != null
                                                        ? countryCode!.flagImage
                                                        : null,
                                                  ),
                                                  Container(
                                                    height: 25,
                                                    width: 50,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 6,
                                                        vertical: 5),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                    ),
                                                    child: Text(
                                                      countryCode?.dialCode ??
                                                          '+1',
                                                      // '+1',
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xff9090AD),
                                                        fontSize: 13,
                                                        fontFamily: 'Manrope',
                                                      ),
                                                    ),
                                                  ),
                                                  const Image(
                                                    image: AssetImage(
                                                        'Image/Vector.png'),
                                                    height: 4,
                                                    width: 7,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Container(
                                                      height: 22,
                                                      width: 1,
                                                      color: Colors.grey,
                                                    ),
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                    // border: InputBorder.none,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    labelText: 'Mobile Phone',
                                    labelStyle: const TextStyle(
                                      color: Color(0xff22215B),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 27, right: 24, left: 24),
                        child: SizedBox(
                          height: 54,
                          width: 327,
                          child: ElevatedButton(
                              onPressed: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MobileOTPUser()));
                              }),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: BackgrnColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                'Get OTP',
                              )),
                        ),
                      ),
                      
                    ],
                  )),
            )
          ],
        )),
      ],
    ));
  }
}
 final docId =[];//// k có cho commit file len 