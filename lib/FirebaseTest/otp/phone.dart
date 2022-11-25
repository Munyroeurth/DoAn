
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/FirebaseTest/otp/otp.dart';

 
class Myphone extends StatefulWidget {
  const Myphone({super.key});

  @override
  State<Myphone> createState() => _MyphoneState();
}

class _MyphoneState extends State<Myphone> {
  TextEditingController countrycode = TextEditingController();
  @override
  void initState(){
    countrycode.text = '+91';
    super.initState();
  }
  var phone = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 800,
          width: 800,
          color: Colors.white10,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: countrycode,
                          decoration: const InputDecoration(border:InputBorder.none),
                        ),
                      ),
                      const Text("|", style: TextStyle(fontSize: 23, color: Colors.grey),),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                          decoration: InputDecoration(
                            border : InputBorder.none, hintText: "Phone"
                          ),
                          ),
                        ))
                    ],
                  ),
                ),
              ElevatedButton(onPressed: (() async{
                // await FirebaseAuth.instance.verifyPhoneNumber(
                //   phoneNumber: "${countrycode.text + phone}",
                //   verificationCompleted:
                //   (PhoneAuthCredential phoneAuthCredential) {},
                //   verificationFailed: (FirebaseAuthException e) {}, 
                //   codeSent: (String  verificationID, int? resendToken){}, 
                //   codeAutoRetrievalTimeout:(String  verificationID){}, );
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>otpScreen()));
                  }), 
                  child: const Text('Send OTP code'))
              ],
            ),
          ),
        )),
    );
  }
}