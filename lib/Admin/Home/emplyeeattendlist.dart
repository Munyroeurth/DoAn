import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/employeeManagement.dart';
import 'package:intl/intl.dart';

import '../Login/inputCountry.dart';
class EmployeeAttenList extends StatefulWidget {
  const EmployeeAttenList({super.key});

  @override
  State<EmployeeAttenList> createState() => _EmployeeAttenListState();
}

class _EmployeeAttenListState extends State<EmployeeAttenList> {
    final TextEditingController _date = TextEditingController();


  Widget _Date(){
    return SizedBox(
      width:150 ,
      height: 56,
      child: TextField(
        controller: _date,
        decoration: InputDecoration(
          hintText: '10/10/2020',
          labelText: 'Date',
          suffixIcon: IconButton(
          onPressed:  (() async {
          DateTime? pickeddate = await showDatePicker(
              context:
                  context,
              initialDate:
                  DateTime
                      .now(),
              firstDate:
                  DateTime(
                      2000),
              lastDate:
                  DateTime(
                      2101));
          if (pickeddate !=
              null) {
            setState(() {
              _date
                  .text = DateFormat(
                      'dd-MM-yyyy')
                  .format(
                      pickeddate);
            });
          }
        }),
            icon: const ImageIcon(AssetImage('Image/Calendar.png')),),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
        ),
      ),
    );
  }
  Widget _markattence(){
    return SizedBox(
      width: 150,
      height: 56,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff22215B)),
            borderRadius: BorderRadius.circular(10)
            ),
          hintText: 'Mark Attence',
          prefixIcon: IconButton(
            onPressed: (() {
            
          }), icon: const ImageIcon(AssetImage('Image/usercheck.png')))
        ),
      ),
    );
  }
  Widget _persion1(){
  return  Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          height: 56,
          width: 327,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 249, 240, 240),
              border: Border.all(
                  color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              /*******Image Icon****** */
              Padding(
                padding:
                    const EdgeInsets.only(left: 10),
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(100)),
                    child: TextButton(
                      onPressed: (() {}),
                      child: const Image(
                        image: AssetImage(
                            'Image/Persion2.png'),
                        height: 50,
                        width: 50,
                      ),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Mehedii Mohammad',
                          style: TextStyle(
                              color: Color(0xff22215B),
                              fontFamily: 'Manrope',
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.normal),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 80),
                      child: Row(
                        children: const [
                          Text(
                            'Manager',
                            style: TextStyle(
                                color:
                                    Color(0xff9090AD),
                                fontFamily: 'Manrope',
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 60),
                child: IconButton(
                    onPressed: (() {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             EmptyEmployee()));
                    }),
                    icon: const Icon(Icons
                        .arrow_forward_ios_outlined),
                    color: const Color(
                      0xff9090AD,
                    )),
              )
            ],
          ),
        ),
      ),
      /////////////////////////////////////////////////
        Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          height: 56,
          width: 327,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 249, 240, 240),
              border: Border.all(
                  color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              /*******Image Icon****** */
              Padding(
                padding:
                    const EdgeInsets.only(left: 10),
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(100)),
                    child: TextButton(
                      onPressed: (() {}),
                      child: const Image(
                        image: AssetImage(
                            'Image/Persion2.png'),
                        height: 50,
                        width: 50,
                      ),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Mehedii Mohammad',
                          style: TextStyle(
                              color: Color(0xff22215B),
                              fontFamily: 'Manrope',
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.normal),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 80),
                      child: Row(
                        children: const [
                          Text(
                            'Manager',
                            style: TextStyle(
                                color:
                                    Color(0xff9090AD),
                                fontFamily: 'Manrope',
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 60),
                child: IconButton(
                    onPressed: (() {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             EmptyEmployee()));
                    }),
                    icon: const Icon(Icons
                        .arrow_forward_ios_outlined),
                    color: const Color(
                      0xff9090AD,
                    )),
              )
            ],
          ),
        ),
      ),
      /////////////////////////////////////////////////
        Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          height: 56,
          width: 327,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 249, 240, 240),
              border: Border.all(
                  color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              /*******Image Icon****** */
              Padding(
                padding:
                    const EdgeInsets.only(left: 10),
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(100)),
                    child: TextButton(
                      onPressed: (() {}),
                      child: const Image(
                        image: AssetImage(
                            'Image/Persion2.png'),
                        height: 50,
                        width: 50,
                      ),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Mehedii Mohammad',
                          style: TextStyle(
                              color: Color(0xff22215B),
                              fontFamily: 'Manrope',
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.normal),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 80),
                      child: Row(
                        children: const [
                          Text(
                            'Manager',
                            style: TextStyle(
                                color:
                                    Color(0xff9090AD),
                                fontFamily: 'Manrope',
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 60),
                child: IconButton(
                    onPressed: (() {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             EmptyEmployee()));
                    }),
                    icon: const Icon(Icons
                        .arrow_forward_ios_outlined),
                    color: const Color(
                      0xff9090AD,
                    )),
              )
            ],
          ),
        ),
      ),
      
    ],
  );
}
Widget _addbutton(){
  return const SizedBox(
    width: 50,
    height: 50,
    child: FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: null,
      child: Icon(Icons.add),),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Stack(
            children: [
              Container(
                width: 800,
                height: 800,
                decoration: const BoxDecoration(
                color: Colors.blueAccent,
                ),
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 62),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EmployeeManagement()));
                                  }),
                                  icon: const Icon(
                                    Icons.arrow_back, 
                                    color: Colors.white,
                                  )),
                              const Text(
                                'Employee List',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                    fontFamily: 'Manrope',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
              Positioned(
                top: 124,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: 375,
                  height: 668,
                  decoration: const BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, right: 24, left: 24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _Date(),
                            _markattence(),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
                  Positioned(
                top: 236,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: 375,
                  height: 668,
                  decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child: Column(
                    children: [
                      _persion1(),  
                      Padding(
                        padding: const EdgeInsets.only(top: 130,left: 291, right: 34, bottom: 0),
                        child: _addbutton(),
                      )        
                    ],
                  ),
                  
                ))
            ],
          )),
        ],
      ),
    );
  }
}
class WoringModal extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  String _ChoceDay = DayofWeek[0];
  WoringModal();
  // ignore: non_constant_identifier_names
  String get ChoceDay => _ChoceDay;
  updateDay(String value) {
    if (value != _ChoceDay) {
      _ChoceDay = value;
      notifyListeners();
    }
  }
}