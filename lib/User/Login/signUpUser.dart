import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/User/Login/Home/HRMUser.dart';
import 'package:flutter_application_1/User/Login/Home/signInUpUser/login_register_page.dart';

class SignUpUser extends StatefulWidget {
  const SignUpUser({super.key});

  @override
  State<SignUpUser> createState() => _SignUpUserState();
}
const BackgrnColor = Color(0xff567DF4);
class _SignUpUserState extends State<SignUpUser> {
  bool isVisible = true;
  bool isToggle = true;
  late final String Password = '';
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _IdController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                               HRMUserScreen()));
                                  }),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Text(
                                'Sign Up',
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
                          child: Text('Sign Up now to begin an amazing journey',
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
                /**********Row 2 ************** */
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
                            const EdgeInsets.only(top: 26, right: 24, left: 24),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              /**************Name Employee***********/
                               Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: TextField(
                                  controller: _NameController,
                                  // obscureText: true,
                                  onChanged: ((value) {
                                    setState(() {
                                      // Password = value;
                                    });
                                  }),
                                  decoration: InputDecoration(
                                      hintText: 'Nguyen ANh Tu',
                                      labelText: 'Your Name',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              /************ID********* */
                              Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 20),
                                child: TextField(
                                  controller: _IdController,
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
                                ),
                              ),
                              /***********Email************ */
                               Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: TextField(
                                  controller: _EmailController,
                                  // obscureText: true,
                                  onChanged: ((value) {
                                    setState(() {
                                      // Password = value;
                                    });
                                  }),
                                  decoration: InputDecoration(
                                      hintText: 'Email@gmail.com',
                                      labelText: 'Email',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              /*******Phone************** */
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 26),
                              //   child: TextField(
                              //     textAlign: TextAlign.left,
                              //     keyboardType: TextInputType.number,
                              //     textInputAction: TextInputAction.done,
                              //     // maxLength: 10,
                              //     decoration: InputDecoration(
                              //         prefixIcon: Container(
                              //           padding: const EdgeInsets.symmetric(
                              //               horizontal: 5, vertical: 3),
                              //           margin: const EdgeInsets.symmetric(
                              //               horizontal: 8),
                              //           child: Row(
                              //             mainAxisSize: MainAxisSize.min,
                              //             children: [
                              //               GestureDetector(
                              //                   onTap: () async {
                              //                     final code = await countryPicker
                              //                         .showPicker(
                              //                             context: context);
                              //                     setState(() {
                              //                       countryCode = code;
                              //                     });
                              //                   },
                              //                   child: Row(
                              //                     children: [
                              //                       Container(
                              //                         height: 21,
                              //                         width: 32,
                              //                         child: countryCode != null
                              //                             ? countryCode!.flagImage
                              //                             : null,
                              //                       ),
                              //                       Container(
                              //                         height: 25,
                              //                         width: 50,
                              //                         padding: const EdgeInsets
                              //                                 .symmetric(
                              //                             horizontal: 6,
                              //                             vertical: 5),
                              //                         decoration: BoxDecoration(
                              //                           borderRadius:
                              //                               BorderRadius.circular(
                              //                                   5),
                              //                           color: Colors.white,
                              //                         ),
                              //                         child: Text(
                              //                           countryCode?.dialCode ??
                              //                               '+1',
                              //                           // '+1',
                              //                           style: const TextStyle(
                              //                             color:
                              //                                 Color(0xff9090AD),
                              //                             fontSize: 13,
                              //                             fontFamily: 'Manrope',
                              //                           ),
                              //                         ),
                              //                       ),
                              //                       const Image(
                              //                         image: AssetImage(
                              //                             'Image/Vector.png'),
                              //                         height: 4,
                              //                         width: 7,
                              //                       ),
                              //                       Padding(
                              //                         padding:
                              //                             const EdgeInsets.only(
                              //                                 left: 10),
                              //                         child: Container(
                              //                           height: 22,
                              //                           width: 1,
                              //                           color: Colors.grey,
                              //                         ),
                              //                       )
                              //                     ],
                              //                   ))
                              //             ],
                              //           ),
                              //         ),
                              //         // border: InputBorder.none,
                              //         border: OutlineInputBorder(
                              //             borderRadius:
                              //                 BorderRadius.circular(10)),
                              //         labelText: 'Mobile Phone',
                              //         labelStyle: const TextStyle(
                              //           color: Color(0xff22215B),
                              //           fontSize: 14.0,
                              //           fontWeight: FontWeight.w400,
                              //         )),
                              //   ),
                              // ),
                              /*******Pass**********/
                              Padding(
                                padding: const EdgeInsets.only(top: 26),
                                child: TextField(
                                  controller: _PassController,
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
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                    onPressed: (() async {
                                     final response = await  FirebaseAuth.instance.createUserWithEmailAndPassword(
                                      email: _EmailController.text,
                                      password: _PassController.text)
                                      .then((value){
                                        print("Create New Account");
                                        // debugPrint("Sign Up ${respone}");
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                             HRMUserScreen()));
                                       }).onError((error, stackTrace){
                                        print("Error ${error.toString()}");
                                       });
                                       print("Sign Up ${response}");
                                    }),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff567DF4),
                                        minimumSize: const Size(327, 54),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: const Text(
                                      'Sign Up',
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
                                            const LoginPage()));
                                      },
                                      child: const Text('SIGN IN',
                                        style: TextStyle(
                                          color: Color(0xff567DF4),
                                          fontFamily: 'Manrope',
                                          fontSize: 13,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold)))
                                ],
                              )
                            ],
                          )),
                        ),
                      ),
                    )
              ]))
        ],
      ),
    );

  }
}

 final docId =[];//// k có cho commit file len 