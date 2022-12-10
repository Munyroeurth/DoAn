import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Login/SignUp/auth/home_page.dart';
import 'package:flutter_application_1/Admin/Login/SignUp/page/rigisterpage.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
          if(snapshot.hasData){
            return const HomePage();
          } else{
            return const RegisterPage();
          }
        }),
    );
  }
}
 final docId =[];//// k có cho commit file len 