import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'otp.dart';
import 'phone.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner : false,
          initialRoute : 'phone',
          routes: {'phone' : (context)=>Myphone(),'otp':(context) =>otpScreen()},
    )
  );
}