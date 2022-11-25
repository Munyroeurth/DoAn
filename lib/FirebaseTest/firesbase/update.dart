import 'package:flutter/material.dart';
import 'package:flutter_application_1/FirebaseTest/firesbase/editthongtinnhanvienFB.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Updatethongtin extends StatefulWidget {
  const Updatethongtin({super.key});

  @override
  State<Updatethongtin> createState() => _UpdatethongtinState();
}

class _UpdatethongtinState extends State<Updatethongtin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 200, left: 50),
          child: Column(
            children: [
              ElevatedButton(onPressed: (() {
                final docUser = FirebaseFirestore.instance
                .collection('users')
                .doc('GJieGUqZMKK4wIr4YJOD');
                // Update specific field
                // docUser.update({
                //   'city.name' : 'Sydney',
                //   'city.country' : 'England',
                //   'name' : FieldValue.delete(),// delete some parameter
                // });
                docUser.set({
                  'name' : 'James'
                });
              }), child: const Text('Update')),
              SizedBox(height: 32,width: 100,
              child: ElevatedButton(child: Text('Delete'),
               onPressed: () {
                final docUser = FirebaseFirestore.instance
                .collection('users')
                .doc('uiYvjJFGUHJzj4oLy6Zj');

              docUser.delete();
                
              },),)
            ],
          ),
        )),
    );
  }
}