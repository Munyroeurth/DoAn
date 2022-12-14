import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/User/Login/Home/HRMUser.dart';
import 'package:flutter_application_1/Admin/Home/staffinfopassstatefull.dart';
import 'package:get/get.dart';

class AttendRequest extends StatefulWidget {
  const AttendRequest({super.key});

  @override
  State<AttendRequest> createState() => _AttendRequestState();
}

class _AttendRequestState extends State<AttendRequest> {
  
  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('AddNhanvien').snapshots();

  @override
  void initState() {
    // users;
    super.initState();
  }

 String txt = 'hello world';

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
                    color: Color(0xff567DF4),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 44),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
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
                                                    const HRMUserScreen()));
                                      }),
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Text(
                                      'Attend Request',
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontFamily: 'Manrope',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  top: 124,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 375,
                    height: 688,
                    decoration: const BoxDecoration(
                        color: Color(0xffFAFAFA),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  child: Padding(
                    padding:  const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 400,
                            height: 300,
                            color: const Color.fromARGB(255, 238, 233, 235),
                            child: StreamBuilder<QuerySnapshot>(
                             stream: users,
                             builder: ((context, snapshot){
                               if(snapshot.hasError){
                                return const Text('Something went Wrong.');
                               }
                               if(snapshot.connectionState == ConnectionState.waiting){
                                return const Text('Laoding.....');
                               }
                               final data = snapshot.requireData;
                               return ListView.builder(
                                itemCount: data.size,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        // Text('User is: ${data.docs[index]['name']}'),
                                        // Text('reference is: ${data.docs[index]['reference']}'),
                                        // Text('Id User is: ${data.docs[index]['id']}'),
                                        SizedBox(
                                          height: 53,
                                          width: 233,
                                          child: ElevatedButton(
                                            onPressed: (() {
                                              // Navigator.push(context, MaterialPageRoute(builder: ((context) =>   PassData(
                                              //   name:data.docs[index]['name'],
                                              //   designation: data.docs[index]['designation'],
                                              //   id: data.docs[index]['id'],
                                              //   joindate: data.docs[index]['joindate'], 
                                              //   numberphone: data.docs[index]['numberphone'],
                                              //   reference: data.docs[index]['reference'],
                                              //   workingday:data.docs[index]['workingday'],
                                              //   ))));
                                            }),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.lightBlueAccent,
                                              
                                            ),
                                           child:Column(
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(backgroundColor: Colors.amber,child: Text('${data.docs[index]['designation']}'),),
                                                  Column(
                                                    children: [
                                                      Text('${data.docs[index]['name']}'),
                                                     Text('${data.docs[index]['designation']}'),
                                                    ],
                                                  ),
                                                
                                                ],
                                              ),
                                              
                                            ],
                                           )),
                                        )
                                      ],
                                    ),
                                  );
                                }));
                             }))
                          ),
                        ),
                        ElevatedButton(
                        onPressed: (() async {
                          final res = await FirebaseFirestore.instance
                          .collection('AddNhanvien')
                          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                          .get()
                          .then((value) {
                            value.docs.forEach((element) {
                              print(element.id);
                            });
                          });
                          print(res);
                          // users;
                          // print('DATA');
                          // debugPrint('users${users}');
                        }), 
                        child: const Text('GetUser'))
                      ],
                    ),
                  ),
                            
              ))
            ],
          )),
        ],
      ),
    );
  }
}

class UserManagerment {
  storeNewUser(user, context) {
    // var
  }

} 

