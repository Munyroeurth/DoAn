import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/User/Login/Home/HRMUser.dart';
import 'package:flutter_application_1/User/Login/Home/signInUpUser/auth.dart';
import 'package:flutter_application_1/User/Login/signUpUser.dart';
import '../../../../Admin/Login/selectRoleScreen.dart';
import '../../ForgetPassUser.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
const BackgrnColor = Color(0xff567DF4);
class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerId = TextEditingController();

  Future<void> signInWithEmailAndPassword(bool isLogin) async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
        employeeId:_controllerId.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword(bool isLogin) async {
    try {
      final response = await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
        employeeId:_controllerId.text,
      );
      // print('createUserResult ${response}');
    } on FirebaseAuthException catch (e) {
      setState((){
        errorMessage = e.message;
      });
    }
  }
  void onpressedFunction(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HRMUserScreen()));
    if (isLogin == true) {
      signInWithEmailAndPassword(isLogin);
    }else{
      createUserWithEmailAndPassword(isLogin);
    }
    // isLogin ? signInWithEmailAndPassword(isLogin) : createUserWithEmailAndPassword(isLogin);
    print(signInWithEmailAndPassword(isLogin));
    print("vaoday");
  }
  Widget _name (){
  return TextField(
  // controller:controllerName,
  // keyboardType: TextInputType.name,
  // obscureText: true,
  onChanged: ((value) {
    setState(() {
      // Password = value;
    });
  }),
  decoration: InputDecoration(
      hintText: 'Deny Brown',
      labelText: 'Employee Name',
      border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(10))),
  );
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
  Widget _Id (
    String id,
    TextEditingController controller){
    return TextField(
    // obscureText: true,
    onChanged: ((value) {
      setState(() {
        // Password = value;
      });
    }),
    decoration: InputDecoration(
        hintText: '1234',
        labelText: 'Employee ID',
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10))),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Your Information ? $errorMessage', style: const TextStyle(color: Colors.red),);
  }
  
  Widget _fogetpass(){
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const ForgetPassUser()));
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
    );
  }

  Widget _submitButton() {
    return SizedBox(
      height: 53,
      width: 500,
      child: ElevatedButton(
           onPressed: onpressedFunction,
        // onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff567DF4),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10))
        ),  
        child: const Text('Sign In', style: TextStyle(fontSize: 23),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                    width: 600,
                    height: 800,
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
                                  padding: const EdgeInsets.only(),
                                  child: IconButton(
                                    onPressed: (() {
                                      createUserWithEmailAndPassword(isLogin);
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
                                  'Sign In Employee',
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
                  width: 600,
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
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: _Id('employeeId',_controllerId),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: _entryField('Email', _controllerEmail),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: _entryField('Password', _controllerPassword),
                        ),
                        // GestureDetector(
                        //   onTap: (() async  {
                        //     String id = _controllerId.toString();
                        //     String Email = _controllerEmail.toString();
                        //     String Pass = _controllerPassword.toString();
                        //     if(id.isNotEmpty) {
                        //       if (Pass.isEmpty) {
                        //         if (Email.isNotEmpty) {
                        //           DocumentSnapshot snap = await FirebaseFirestore.instance
                        //             .collection("AddNhanvien")
                        //             .doc(id.toUpperCase())
                        //             .get();
                        //           String password = snap ['password'];
                        //           if(Pass == password) {
                        //             setState(() {
                        //               LoginInfo.id = id.toLowerCase();  
                        //             });
                        //             Navigator.pushReplacement(context,
                        //              MaterialPageRoute(builder: (context)=>const HRMUserScreen()));
                        //           }
                                  
                        //         }
                                
                        //       }
                        //     }
                            
                        //   }),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: _errorMessage(),
                        ),
                         Padding(
                           padding: const EdgeInsets.only(left: 170),
                           child: _fogetpass(),
                         ),
                        _submitButton(),
                       
                        // _loginOrRegisterButton(),
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
                                              const SignUpUser()));
                                },
                                child: const Text('SIGN UP',
                                    style: TextStyle(
                                      color: Color(0xff567DF4),
                                      fontFamily: 'Manrope',
                                      fontSize: 13,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold)))
                                ],
                              )
                      ],
                      ),
                    ),
                  ),
                ))
            ]),
          ),
        ],
      ),
    );
  }
}

class LoginInfo {
  static String id = ' ';
}
    