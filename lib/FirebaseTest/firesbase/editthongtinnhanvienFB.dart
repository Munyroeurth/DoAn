import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/FirebaseTest/firesbase/readthongtin.dart';
import 'package:flutter_application_1/FirebaseTest/firesbase/update.dart';

class FiresBaseSetup extends StatefulWidget {
  const FiresBaseSetup({super.key});

  @override
  State<FiresBaseSetup> createState() => _FiresBaseSetup();
}

class _FiresBaseSetup extends State<FiresBaseSetup> {
  final databaseReference  = FirebaseFirestore.instance;
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerBirthday = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body:Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text('CẤP NHẬT THÔNG TIN NHÂN VIÊN'),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: controllerName,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: controllerAge,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      hintText: 'Age',
                      border: OutlineInputBorder(),
                    ),
                    
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    // controller: controllerBirthday,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: 'Birthday Day',
                      border: OutlineInputBorder(),
                    ),
                    
                  ),
                ),
                 ElevatedButton(onPressed: (() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Updatethongtin()));
              
                }), child: const Text('Update')),
                ElevatedButton(onPressed: (() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Updatethongtin()));
              
                }), child: const Text('Delete')),
                Padding(
                  padding:  const EdgeInsets.only(left: 200, top: 100),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: ((){
                          // final user = User(
                          //   age: int.parse(controllerAge.text), 
                          //   name: controllerName.text, 
                          //   // birthday: DateTime.parse(controllerBirthday.text)
                          //   );
                            // createUser(user);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Readthongtinnhanvien()));
                         
                        }),),
                    )
                  ),
                ),
               
              ],
            ),
          ),
        ),
      )
    );
   
    
  }
}

Future createUser(User user) async{
      /**** Referece to document *****/
      final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');
      user.id = docUser.id;
      final json = user.toJson();
    /******* Create Document and write data to Firebase *****/
    await docUser.set(json);
}

class User {
  String id ;
  final String name ;
  final int age;
  // final DateTime birthday;

  User({
    this.id = '',
    required this.age,
    required this.name,
    // required this.birthday
  });

  Map<String , dynamic> toJson() =>{
    'id':id,
    'name':name,
    'age':age,
    // 'birthday':birthday,
  };
  static User fromJson(Map<String, dynamic> json) => User (
    id: json['id'],
    name: json['name'],
    age: json['age'],
    // birthday:(json['birthday'] as  Timertamp).toDate(),
   );
}

