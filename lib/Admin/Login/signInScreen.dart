import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Login/SignUp/signUpAdminHR.dart';
import 'package:flutter_application_1/Admin/Login/ForgetPass.dart';
import 'package:flutter_application_1/Admin/Login/selectRoleScreen.dart';

import '../../User/Login/Home/login/auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

const BackgrnColor = Color(0xff567DF4);

class _SignInScreenState extends State<SignInScreen> {
  bool isVisible = true;
  bool isToggle = true;
  bool notification = true;
  late final String Password = '';
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  String? errorMessage = '';
  bool isLogin = true;

  
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controller = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }
   Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10))
      ),
    );
  }
Widget _Email (
   String titte,
   TextEditingController controller,
  ){
    return TextField(
    controller: controller,
    decoration: InputDecoration(
        hintText: 'admin@gmail.com',
        labelText: 'Email',
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10))),
    );
  } 
  Widget _Password(
     String titte,
   TextEditingController controller,
  ){
    return TextField(
      controller: controller,
      autofocus: true,
        keyboardType: TextInputType.visiblePassword,
      // keyboardType:,
      obscureText: isVisible,
      onChanged: ((value) {
        setState(() {
          // Password = value;
        });
      }),
      decoration: InputDecoration(
          hintText: 'PassWord',
          labelText: 'PassWord',
          suffixIcon: IconButton(

              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: isVisible == true
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility)),
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(10))),
    );
  }
  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Your Information ? $errorMessage', style: const TextStyle(color: Colors.red),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Stack(children: [
                Container(
                  width: 400,
                  height: 600,
                  // color: Color.fromARGB(255, 41, 121, 187),
                  color: BackgrnColor,
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            // left: 29,
                            top: 69,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(),
                                child: IconButton(
                                  onPressed: (() {
                                    createUserWithEmailAndPassword();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SelectRole()));
                                  }),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Manrope',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              // left: 24,
                              right: 80),
                          child: Text('Sign In now to begin an amazing journey',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Manrope',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal)),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 152,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: 400,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top:40, right: 24, left: 24),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _Email('Emails', _controllerEmail),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: _Password('Password', _controllerPassword),
                              ),
                  
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: _errorMessage(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16,),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Switch(
                                          activeColor: Colors.blue,
                                          value: notification,
                                          onChanged:(value){
                                            setState(() {
                                              notification = value;
                                            });
                                          }),
                                        Row(
                                          children: const [
                                            Text(
                                              'Save me',
                                              style: TextStyle(
                                                  fontFamily: 'Manrope',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 11, 9, 155)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ForgetPassSreen()));
                                      },
                                      child: const Text(
                                        'Forget Password ?',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontSize: 14,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 27, 13, 132)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                    onPressed:
                                     isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: BackgrnColor,
                                        minimumSize: Size(327, 54),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: const Text(
                                      'Sign In',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Manrope',
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Dont’t have an account?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff9090AD),
                                        fontFamily: 'Manrope',
                                        fontSize: 13,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignInHR()));
                                      },
                                      child: const Text('SIGN UP',
                                          style: TextStyle(
                                              color: Color(0xff567DF4),
                                              fontFamily: 'Manrope',
                                              fontSize: 13,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold)))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 92, bottom: 8),
                                child: Container(
                                width: 134,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Color(0xff9090AD),
                                  // border: Border.all(
                                  //     color: Colors.white,
                                  //     width: 1,
                                  //     style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                ),
                              )
                            ],
                          )),
                        ),
                      ),
                   ),
              ]))
        ],
      ),
    );
  }
}
