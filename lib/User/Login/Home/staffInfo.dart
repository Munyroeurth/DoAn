import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/addEmployee.dart';
import 'package:flutter_application_1/FirebaseTest/firesbase/editthongtinnhanvienFB.dart';
import 'package:flutter_application_1/User/Login/Home/signInUpUser/auth.dart';
import 'package:flutter_application_1/src/API/API_DIO/Post/PostDio.dart';


class StaffInfo extends StatefulWidget {
  String? name;
  String? id;
  String? email;
  String? numberphone;
  String? designation;
  String? gender;
  String? reference;
  String? workingday;
  
  StaffInfo({
    required this.name,
    required this.designation,
    required this.id,
    required this.email,
    required this.numberphone,
    required this.reference,
    required this.workingday,
    required this.gender,
    super.key});

  @override
  State<StaffInfo> createState() => _StaffInfoState();
}

class _StaffInfoState extends State<StaffInfo> {
  @override
  Widget build(BuildContext context) {

   final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('AddNhanvien').snapshots();
   final user = Auth().currentUser;
    return  Scaffold(
      appBar: AppBar(title: const Text('Your Information')),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 600,
                height: 560,
                color: const Color(0xff567DF4),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (() {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDio()));
                        }), icon: const Icon(Icons.forward_10))
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 50,
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 400,
                  width: 400,
                  decoration:  const BoxDecoration(
                    color:  Color(0xffFAFAFA),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children:  [
                        Container(
                          height: 60,
                          width: 300,
                         decoration: BoxDecoration(
                          color:  const Color(0xffFAFAFA),
                          borderRadius:BorderRadius.circular(24),
                        ), 
                        child:  Row(
                          children:  [
                            const Padding(
                              padding: EdgeInsets.only(left: 10,right: 5),
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: CircleAvatar(backgroundColor: Colors.purple,child: Text('ID:'),)),
                            ),
                            Text(user?.uid ?? 'User Email', style: const TextStyle(fontSize: 13),),
                          ],
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 100,
                            width: 300,
                           decoration: BoxDecoration(
                            color:  const Color(0xffFAFAFA),
                            borderRadius:BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 15, right: 15,bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Name'),
                                    Text('Email'),
                                    Text('Number Phone'),
                                    
                                  ],
                                ),
                                Container(height: 1,color: Colors.black,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text(widget.name??''),
                                    Text(widget.email??''),
                                    Text(widget.numberphone??''),

                                  ],
                                )
                              ],
                            ),
                          ),
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 100,
                            width: 300,
                           decoration: BoxDecoration(
                            color:  const Color(0xffFAFAFA),
                            borderRadius:BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 15, right: 15,bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                     Text('Designation'),
                                    Text('Gender'),
                                    Text('Reference'),
                                  ],
                                ),
                                Container(height: 1,color: Colors.black,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    // Text(widget.designation??''),
                                    // Text(widget.gender??''),
                                    // Text(widget.reference??""),
                                  ],
                                )
                              ],
                            ),
                          ),
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 100,
                            width: 300,
                           decoration: BoxDecoration(
                            color:  const Color(0xffFAFAFA),
                            borderRadius:BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 15, right: 15,bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                   Text('Working day') 
                                  ],
                                ),
                                Container(height: 1,color: Colors.black,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(widget.workingday??""),
                                   
                                  ],
                                )
                              ],
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ],
      ),

    );
  }
}