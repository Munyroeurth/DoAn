
import 'package:flutter/material.dart';
import 'package:flutter_application_1/User/Login/Home/HRMUser.dart';
import 'package:flutter_application_1/User/Login/Home/signInUpUser/auth.dart';
import 'package:flutter_application_1/User/Login/Home/signInUpUser/home_page.dart';
import 'package:flutter_application_1/User/Login/Home/signInUpUser/login_register_page.dart';

class WidgetTreeUser extends StatefulWidget {
  const WidgetTreeUser({Key? key}) : super(key: key);

  @override
  State<WidgetTreeUser> createState() => _WidgetTreeUserState();
}

class _WidgetTreeUserState extends State<WidgetTreeUser> {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  HRMUserScreen();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
