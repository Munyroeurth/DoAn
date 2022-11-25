import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/addEmployee.dart';
import 'package:flutter_application_1/staticRoute/get_user_name.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;

  //document IDs
  List<String> docIDs = [];

  // get docIDs
  Future getDocIDs () async {
    await FirebaseFirestore.instance.collection('AddNhanvien').get().then(
      (snapshot) => snapshot.docs.forEach(
        (document){
        print(document.reference);
        docIDs.add(document.reference.id);
      },
    ));

  }
  @override 
  void initState(){
    getDocIDs();
    super.initState();
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
                height: 800,
                width: 800,
                color:Colors.blue
                      
              ),
              Positioned(
                top: 123,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    )
                  ),
                  child: Column(
                    children: [
                      // Text('signed in as' + AddNhanVien.numberphone!),
                      ElevatedButton(onPressed: ((() {
                        
                      })), child:Text('Static Route')),
                      Expanded(
                        child: FutureBuilder(
                          future: getDocIDs() ,
                          builder: ((context, snapshot) {
                            return ListView.builder(
                            itemCount: docIDs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  // title:  Text(docIDs[index]),
                                  title: GetuserName(documentId: docIDs[index]),
                                  // selectTileColor: Colors.lightGreen,
                                  tileColor: Colors.amber,
                                  
                                ),
                              );
                            },
                          );
                          }),
                        ))
                    ],
                  )
                ))
            ]),
          ),
        ],
      ),
    );
  }
}