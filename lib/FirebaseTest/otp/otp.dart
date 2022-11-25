import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'package:pinput/pinput.dart';
class otpScreen extends StatefulWidget {
  const otpScreen({super.key});

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  var code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              children: [
                 Text('PIN PUT'),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //     child: Pinput(
                //       length : 6,
                //       showCursor: true,
                //       onChanged: (value) {
                //         code : value;
                //       },
                //     ),
                  
                // ),
                ElevatedButton(onPressed: (() async{
                  // PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verify, smsCode: code);
                //  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: Myphone.verify , smsCode: code);
                }),
                 child: Text('Verify Phone Number'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}