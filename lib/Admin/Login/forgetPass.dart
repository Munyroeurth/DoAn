
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Login/enterOTP.dart';
import 'package:flutter_application_1/Admin/Login/SignInScreen.dart';
import 'package:country_picker/country_picker.dart';
void main() {
  runApp(const ForgetPassSreen());
}

class ForgetPassSreen extends StatefulWidget {
  const ForgetPassSreen({super.key});

  @override
  State<ForgetPassSreen> createState() => _ForgetPassSreenState();
}

const BackgrnColor = Color(0xff567DF4);

class _ForgetPassSreenState extends State<ForgetPassSreen> {
  String tittle = 'Country Code Picker';
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
                                          const SignInScreen()));
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
                  margin:  const EdgeInsets.symmetric(horizontal: 1),
                  // height: size.height * 0.2 - 27,
                  height: 10,
                  decoration:  const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36))),
                  child: Padding(
                    padding:  const EdgeInsets.only(top:10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 23, top: 43, right: 25),
                          child: TextField(
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Email',
                                hintText: 'Email Address',
                                prefixIcon: Icon(Icons.email)),
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
                                              const EnterOTP()));
                                }),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: BackgrnColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                child: Text(
                                  'Get OTP',
                                )),
                          ),
                        ),
                        
                      ],
                    ),
                  )
                  ),
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
