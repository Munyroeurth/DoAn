// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dart:math' as math;

import 'package:flutter_application_1/Admin/Login/SplashAuth3.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

const BackgrnColor = Color(0xff567DF4);

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  late AnimationController SplashController;
  // ignore: non_constant_identifier_names
  late Animation<double> Spashanimation;
  @override
  void initState() {
    super.initState();
    SplashController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );
    Spashanimation = Tween<double>(
      begin: 1,
      end: 1,
    ).animate(SplashController)
      ..addListener(() {
        setState(() {});
      });
    SplashController.forward();
    Spashanimation =
        CurvedAnimation(parent: SplashController, curve: Curves.easeIn);
    _navigatePlashScreen();
  }

  _navigatePlashScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Splash()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: BackgrnColor,
              height: 900,
              child: Stack(
                children: [
                    Transform.rotate(
                    angle: Spashanimation.value,
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      // child: const Image(
                      //   image: AssetImage('Image/LogoSplash.png'),
                      //   width: 217,
                      //   height: 217,
                      // ),
                    )),
                  const SpinKitRipple(
                      color: Color(0xffFFFFFF),
                      size: 200,
                    ),
                  const Padding(
                    padding: EdgeInsets.only(top: 600, left: 132, right: 121),
                    child: Text('Version 1.0.0', textAlign: TextAlign.center, style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 625, right: 121, left: 121),
                    child: Container(
                      width: 134,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xff9090AD),
                        // border: Border.all(
                        //     color: Colors.white,
                        //     width: 1,
                        //     style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  )
                ],
              ), 
            ),
            
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SplashController.dispose();
    super.dispose();
  }
}
