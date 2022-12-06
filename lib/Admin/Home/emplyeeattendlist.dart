import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/employeeChecktime.dart';
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
  final user = FirebaseAuth.instance.currentUser!;
  final getUsers = FirebaseFirestore.instance.collection('AddNhanvien');

  List<String> docIDS = [];
  Future getDocIDs () async{
    final res = await getUsers.get().then(
      (value) => value.docs.forEach((element) {
        print(element.reference);
        docIDS.add(element.reference.id);
    }));
  }
 
  
  Widget _persion1(){
  return FutureBuilder(
      future: getDocIDs(),
      builder: ((context, snapshot) {
        return ListView.builder(
          itemCount: docIDS.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                ListTile(
                title: GetNhanvien(document: docIDS[index],)
                ),
              ],
            );
          })
        );
      }
    ),
  );
}

Widget _addbutton(){
  return const SizedBox(
    width: 500,
    height: 500,
    child: FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: null,
      child: Icon(Icons.add)),
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
                child: SingleChildScrollView(
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
                  ),
                )),
                Positioned(
                top: 236,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: 700,
                  height: 668,
                  decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child:  _persion1(),   
                ),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 580,left: 291, right: 34, bottom: 0),
                child: _addbutton(),
              )        
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

class GetNhanvien extends StatelessWidget {
  final String document;

  const GetNhanvien({required this.document});

  //  Widget _containColor(){
  //   RandomColor _randomColor = RandomColor();
  //   Color _color = _randomColor.randomColor(
  //     colorBrightness:ColorBrightness.light
  //   );
  //   return CircleAvatar(
  //         // backgroundColor:  _randomColor,
  //         child: Text('${data['id']??''}'),),
  // }

  @override
  Widget build(BuildContext context) {
    CollectionReference nhanvien = FirebaseFirestore.instance.collection('AddNhanvien');
    return FutureBuilder<DocumentSnapshot>(
      future: nhanvien.doc(document).get(),
      builder: ((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data?.data()
          as Map<String, dynamic>;
          return SizedBox(
            height: 56,
            width: 327,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: ((context) => const TimeList())));
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffFFFFFF),
              shape: RoundedRectangleBorder(
                borderRadius:
                      BorderRadius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      
                      CircleAvatar(
                        // backgroundColor:  _randomColor,
                        child: Text('${data['id']??''}'),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${data['name']}',
                               textAlign: TextAlign.center,
                               style: const TextStyle(
                               color: Color(0xff22215B),
                               fontSize: 10)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('${data['designation']??''}',
                              textAlign: TextAlign.center,
                               style: const TextStyle(
                                color: Color(0xff9090AD),
                                fontSize: 10),
                              ),
                            ],
                          ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: IconButton(
                  onPressed: (() { }),
                  icon: const Icon(Icons
                      .arrow_forward_ios_outlined),
                  color: const Color(
                    0xff9090AD,
                  )),
                  ),
                 ],
                ),
              )
            );
          }
          return const Text('loading......');
        }
      )
    );
  }
}