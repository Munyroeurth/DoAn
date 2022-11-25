import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  Future signUp () async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
       password: _passController.text.trim());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 700,
            width: 800,
            color: Colors.white,
            child: Column(
              children: [
              SizedBox(
                height: 54,
                width: 136,
                  child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: 'Email',
                    labelText: 'Email',
                  )),
                  ),
              SizedBox(
                height: 54,
                width: 136,
                  child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: 'pass',
                    labelText: 'Pass',
                  )),
                  ),
                  
                SizedBox(
                  height: 54,
                  width: 200,
                  child: ElevatedButton(
                    onPressed:(() {
                      
                    }),
                    child: Text(''),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}