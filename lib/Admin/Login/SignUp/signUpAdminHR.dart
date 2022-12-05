import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/hRMScreen.dart';
import 'package:flutter_application_1/Admin/Login/signInScreen.dart';
import 'package:flutter_application_1/User/Login/Home/HRMUser.dart';
import 'package:flutter_application_1/Admin/Login/SignIn/login/widget_tree_admin.dart';

class SignUpHR extends StatefulWidget {
  const SignUpHR({super.key});

  @override
  State<SignUpHR> createState() => _SignUpHRState();
}
 final countryPicker = const FlCountryCodePicker();
 bool isVisible = true;
CountryCode? countryCode;
class _SignUpHRState extends State<SignUpHR> {

  final _comapnyNameController = TextEditingController();
  final _adminNameContrpller = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  

  @override
  void dispose(){
    _adminNameContrpller.dispose();
    _adminNameContrpller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final User? user = auth.currentUser;
  // final uid = user!.uid;

  Future signUp () async {
   final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _emailController.text,
    password: _passwordController.text)
    .then((value){
      print("Sign Up HR");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HRMScreen()));
    }).onError((error, stackTrace){
      print("Error ${error.toString()}");
    });
    print("Sign Up ${response}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  height: 640,
                  width: 700,
                  color: Color(0xff567DF4),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                              const SignInScreen()));
                                  }),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Text(
                                'Sign Up Owner / Admin / HR',
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
                Positioned(
                    top: 152,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 680,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        border: Border.all(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36),
                        ),
                      ),
                      child: ListView(
                        children:[ Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 26, left: 24, right: 24),
                                child: TextField(
                                  controller: _comapnyNameController,
                                  decoration: InputDecoration(
                                      hintText: 'Dhaka IT',
                                      labelText: 'Company Name',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 26, left: 24, right: 24),
                                child: TextField(
                                  controller: _adminNameContrpller,
                                  decoration: InputDecoration(
                                      hintText: 'Maan Theme',
                                      labelText: 'Owner / Admin Name',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 26, left: 24, right: 24),
                                child: TextField(
                                   controller: _emailController,
                                   decoration: InputDecoration(
                                    hintText: 'maantheme@gmail.com',
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                      borderRadius:
                                        BorderRadius.circular(10))),
                      
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 26, left: 24, right: 24),
                              //   child: TextField(
                              
                              //   textAlign: TextAlign.left,
                              //   keyboardType: TextInputType.number,
                              //   textInputAction: TextInputAction.done,
                              //   // maxLength: 10,
                              //   decoration: InputDecoration(
                              //       prefixIcon: Container(
                              //         padding: const EdgeInsets.symmetric(
                              //             horizontal: 5, vertical: 3),
                              //         margin: const EdgeInsets.symmetric(
                              //             horizontal: 8),
                              //         child: Row(
                              //           mainAxisSize: MainAxisSize.min,
                              //           children: [
                              //             GestureDetector(
                              //                 onTap: () async {
                              //                   final code = await countryPicker
                              //                       .showPicker(
                              //                           context: context);
                              //                   setState(() {
                              //                     countryCode = code;
                              //                   });
                              //                 },
                              //                 child: Row(
                              //                   children: [
                              //                     Container(
                              //                       height: 21,
                              //                       width: 32,
                              //                       child: countryCode != null
                              //                           ? countryCode!.flagImage
                              //                           : null,
                              //                     ),
                              //                     Container(
                              //                       height: 25,
                              //                       width: 50,
                              //                       padding: const EdgeInsets
                              //                               .symmetric(
                              //                           horizontal: 6,
                              //                           vertical: 5),
                              //                       decoration: BoxDecoration(
                              //                         borderRadius:
                              //                             BorderRadius.circular(
                              //                                 5),
                              //                         color: Colors.white,
                              //                       ),
                              //                       child: Text(
                              //                         countryCode?.dialCode ??
                              //                             '+1',
                              //                         // '+1',
                              //                         style: const TextStyle(
                              //                           color:
                              //                               Color(0xff9090AD),
                              //                           fontSize: 13,
                              //                           fontFamily: 'Manrope',
                              //                         ),
                              //                       ),
                              //                     ),
                              //                     const Image(
                              //                       image: AssetImage(
                              //                           'Image/Vector.png'),
                              //                       height: 4,
                              //                       width: 7,
                              //                     ),
                              //                     Padding(
                              //                       padding:
                              //                           const EdgeInsets.only(
                              //                               left: 10),
                              //                       child: Container(
                              //                         height: 22,
                              //                         width: 1,
                              //                         color: Colors.grey,
                              //                       ),
                              //                     )
                              //                   ],
                              //                 ))
                              //           ],
                              //         ),
                              //       ),
                              //       // border: InputBorder.none,
                              //       border: OutlineInputBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(10)),
                              //       labelText: 'Mobile Phone',
                              //       labelStyle: const TextStyle(
                              //         color: Color(0xff22215B),
                              //         fontSize: 14.0,
                              //         fontWeight: FontWeight.w400,
                              //       )),
                              //   ),
                              // ),
                               Padding(
                                padding:  EdgeInsets.only(top: 26, left: 24, right: 24),
                                child: TextField(
                                  obscureText: isVisible,
                                  controller: _passwordController,
                                   decoration: InputDecoration(
                                    hintText: '**********',
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisible = !isVisible;
                                        });
                                      }, 
                                      icon: isVisible == true
                                      ? const Icon(Icons.visibility_off)
                                      :const Icon(Icons.visibility)),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                        BorderRadius.circular(10)),
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 26, left: 24, right: 24),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff567DF4),
                                        minimumSize: Size(327, 54),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: (() {
                                      signUp();
                                      print('VaoDya');
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => WidgetTreeAdmin()));
                                    }),
                                    child: const Text(
                                      'Sing Up',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xffFFFCF9),
                                        fontSize: 20,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4, left: 80, right: 80),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Have an account?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff9090AD),
                                          fontFamily: 'Manrope',
                                          fontSize: 13,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));
                                        },
                                        child: const Text('SIGN IN',
                                            style: TextStyle(
                                                color: Color(0xff567DF4),
                                                fontFamily: 'Manrope',
                                                fontSize: 13,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold)))
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 40, left: 136, right: 136),
                                child: Text(
                                  'Or Sign in with',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff9090AD),
                                      fontFamily: 'Manrope',
                                      fontSize: 13,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: (() {}),
                                        child: Image.asset('Image/Facebook.png')),
                                    TextButton(
                                        onPressed: (() {}),
                                        child: Image.asset('Image/Google.png')),
                                    TextButton(
                                        onPressed: (() {}),
                                        child: Image.asset('Image/Twitter.png')),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 43, bottom: 8),
                                child: Container(
                                  width: 134,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff9090AD),
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              )
                            ]
                            ),
                       ]),
                    ))
              ],
            ))
      ],
    ));
  }
}
