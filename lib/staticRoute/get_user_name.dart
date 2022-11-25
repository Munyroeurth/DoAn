import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/addEmployee.dart';


class GetuserName extends StatelessWidget {

  final String documentId;
  GetuserName({ required this.documentId});

  @override
  Widget build(BuildContext context) {
    //get the collection

    CollectionReference users = FirebaseFirestore.instance.collection('AddNhanvien');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['name']}' + ' ' + '${data['gender']}');
        }
        return Text('loading.....');
      }));
  }
}