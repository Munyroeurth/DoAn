
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/hRMScreen.dart';
import 'package:flutter_application_1/Admin/Login/signInScreen.dart';
import 'package:flutter_application_1/User/Login/Home/login/auth.dart';


class WidgetTreeAdmin extends StatefulWidget {
  const WidgetTreeAdmin({super.key});

  @override
  State<WidgetTreeAdmin> createState() => _WidgetTreeAdminState();
}

class _WidgetTreeAdminState extends State<WidgetTreeAdmin> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream : Auth().authStateChanges,
       builder: (BuildContext context, snapshot) { 
        if(snapshot.hasData) {
          return const HRMScreen();
        }else{
          return const SignInScreen();
        }
        },
    );
  }
}