import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Login/Array/LoginArray.dart';
import 'package:flutter_application_1/Admin/Login/selectRoleScreen.dart';

void main() {
  runApp(const Splash());
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

const BackgrnColor = Color(0xffF0FDFF);
const Contencolor = Color(0xff9090AD);
const TitleColor = Color(0xff22215B);
const FloatColor = Color(0xff567DF4);
const SkipColor = Color(0xff363C49);

class _SplashState extends State<Splash> {
  var _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                  child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          _selectIndex = index;
                        });
                      },
                      itemCount: LoginList.length,
                      itemBuilder: ((context, index) => Stack(
                            children: [
                              Container(
                                  width: 375,
                                  height: 812,
                                  color: BackgrnColor,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 65, right: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: (() {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SelectRole()));
                                              }),
                                              child: Text(
                                                LoginList[index].BackBa,
                                                style: const TextStyle(
                                                    color: SkipColor,
                                                    fontFamily: 'Manrope',
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Image.asset(
                                        LoginList[index].Image,
                                        width: 342.47,
                                        height: 265.83,
                                      ),
                                    ],
                                  )),
                              Positioned(
                                  top: 390,
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                      width: 375,
                                      height: 370,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          // border: Border.all(
                                          //     color: Colors.grey,
                                          //     width: 0,
                                          //     style: BorderStyle.solid),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(36),
                                            topRight: Radius.circular(36),
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, left: 24),
                                        child: Column(
                                          children: [
                                            Text(
                                              textAlign: TextAlign.left,
                                              LoginList[index].Title,
                                              style: const TextStyle(
                                                  color: TitleColor,
                                                  fontSize: 30,
                                                  fontStyle: FontStyle.normal,
                                                  fontFamily: 'Manrope',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(LoginList[index].Content,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                    color: Contencolor,
                                                    fontSize: 14,
                                                    fontStyle: FontStyle.normal,
                                                    fontFamily: 'Manrope')),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    ...List.generate(
                                                        LoginList.length,
                                                        (index) => Indicator(
                                                              isActive:
                                                                  _selectIndex ==
                                                                          index
                                                                      ? true
                                                                      : false,
                                                            )),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 34),
                                                  child: FloatingActionButton(
                                                    backgroundColor: FloatColor,
                                                    onPressed: (() {
                                                      _selectIndex = 0;
                                                    }),
                                                    child: const Icon(
                                                      Icons
                                                          .arrow_forward_ios_sharp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          )))))
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final isActive;
  const Indicator({super.key, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            width: isActive ? 20 : 5,
            height: 4.0,
            decoration: BoxDecoration(
                color: isActive
                    ? Color.fromARGB(255, 81, 130, 185)
                    : Color.fromARGB(84, 9, 52, 140),
                borderRadius: BorderRadius.circular(5.0)),
            child: Container(),
          ),
        ),
      ],
    );
  }
}
