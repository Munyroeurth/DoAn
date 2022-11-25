import 'dart:core';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/FirebaseTest/firesbase/editthongtinnhanvienFB.dart';

class Readthongtinnhanvien extends StatefulWidget {
  const Readthongtinnhanvien({super.key});

  @override
  State<Readthongtinnhanvien> createState() => _ReadthongtinnhanvienState();
}

class _ReadthongtinnhanvienState extends State<Readthongtinnhanvien> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text ('Read Thong tin Nhan vien')),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            FutureBuilder<User?>(
              future: readUser(),
              builder: (context, snapshot){
              if (snapshot.hasError){
                return Text('Some went wrong ! ${snapshot.data}');
              }  
              if(snapshot.hasData){
                final user = snapshot.data;
                return user != null
                       ? const Center(child: Text('No User'))
                       : builderUser(User, user);
              }else{
                return const Center(child: CircularProgressIndicator(),);
                
              } 
            }),
             Padding(
               padding: const EdgeInsets.only(top: 100),
               child: FloatingActionButton(
                onPressed: ((){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>const FiresBaseSetup()));
                }),
                child: const Icon(Icons.add),),
             )
          ],
        ),
      ),
    );
  }
Widget builderUser(User, user) => ListTile(
  leading: CircleAvatar(child: Text('${user.age}',)),
  title: Text(user.name),
  subtitle: Text(user.birthday.toIso8601String()),

);
Stream<List<User>> readUsers() => FirebaseFirestore.instance
    .collection('nhanvien')
    .snapshots()
    .map((snapshot)=>
      snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

Future<User?> readUser() async{
  final docUser = FirebaseFirestore.instance.collection('nhanvien').doc('UOUx3Ir8TmL1QDxONP6g');
  final snapshot = await docUser.get();
  if(snapshot.exists){
    return User.fromJson(snapshot.data()!);
  }
}
// Future createUser({ required String name}) async{
//     /**** Referece to document *****/
//     final docUser = FirebaseFirestore.instance.collection('nhanvien').doc('UOUx3Ir8TmL1QDxONP6g');
//     final json = {
//       'id' : docUser.id,
//       'name': name,
//         'age' : 21,
//         'birthday': 21-2-1992,
//     };
//   /******* Create Document and write data to Firebase *****/
//   await docUser.set(json);
// }
}
class User {
  String id ;
  final String name ;
  final int age;
  final DateTime birthday;
  User({
    this.id = '',
    required this.age,
    required this.name,
    required this.birthday
  });
  Map<String , dynamic> toJson() =>{
    'id':id,
    'name':name,
    'age':age,
    'birthday':birthday,
  };
  static User fromJson(Map<String, dynamic> json) => User (
    id: json['id'],
    name: json['name'],
    age: json['age'],
    birthday:(json['birthday'] as  Timestamp).toDate(),
   );
}

