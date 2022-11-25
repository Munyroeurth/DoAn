import 'package:flutter/material.dart';
class LoginFirebase extends StatefulWidget {
  const LoginFirebase({super.key});

  @override
  State<LoginFirebase> createState() => _LoginFirebaseState();
}

class _LoginFirebaseState extends State<LoginFirebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(),
        ],
      ),
    );
  }
}