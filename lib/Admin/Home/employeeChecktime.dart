import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'emplyeeattendlist.dart';

class TimeList extends StatefulWidget {
  const TimeList({super.key});

  @override
  State<TimeList> createState() => _TimeListState();
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
class _TimeListState extends State<TimeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
            children: [
               Container(
                    width: 700,
                    height: 700,
                    color: const Color(0xff567DF4),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 44),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EmployeeAttenList()));
                                }),
                                icon: const Icon(Icons.arrow_back),
                                color: const Color(0xffFFFFFF),
                              ),
                              const Text('Employee List',
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontFamily: 'Manrope',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              /********Search******/
                              Padding(
                                padding: const EdgeInsets.only(left: 150),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white10,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                        color: const Color(0xffFFFFFF),
                                        icon: const Icon(Icons.search),
                                        onPressed: () {
                                          showSearch(
                                            context: context,
                                            delegate: CustomSearch());
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                    Positioned(
                      top: 123,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child:Container(
                        width: 700,
                        height: 700,
                        decoration: const BoxDecoration(
                          color: Color(0xffE5E5E5),
                          // boxShadow: BoxShadow(color: Colors.blue),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                        child: FutureBuilder(
                        future: getDocIDs(),
                        builder: ((context, snapshot) {
                          return ListView.builder(
                            itemCount: docIDS.length,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                  title: GettimeUser(documentId: docIDS[index],)
                                       ),
                                    ],
                                  );
                                })
                              );
                            }
                          ),
                        )
                      ))
            ],
          )),
        ],
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {

  List<String> docIDs = [];

  Future getDocIDs () async {
    final res = await FirebaseFirestore.instance.collection('AddNhanvien').get().then(
      (snapshot) => snapshot.docs.forEach(
        (document){
        print(document.reference);
        docIDs.add(document.reference.id.characters.string);
        // print('doIDs ${docIDs}');
      },
    ));
    
  }
  
  @override
  List<Widget>? buildActions(BuildContext context) {
     return[
      IconButton(
        onPressed: (() {
          query = '';
      }), icon: const Icon(Icons.clear))
    ];
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
     return 
      IconButton(
        onPressed: (() {
          close(context, null);
       }), icon: const Icon(Icons.arrow_back));
   
  }
   final docId =[];//// k có cho commit file len 
   final docsId =[];//// k có cho commit file len 
  @override
  Widget buildResults(BuildContext context) {

   List<String> matchQuery = [];
    for(var item in docIDs){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
        // this.docIDs = docIDs;
        print(matchQuery);
        getDocIDs();
      }
    }
    return FutureBuilder(
      future: getDocIDs(),
      builder: ((context, snapshot) {
        return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index){
        var resualt = matchQuery[index];
        // var resualtSearch = docIDs[index];
        return ListTile(
          // title: GetNhanVienInformation(documentId: resualt[index],resualt:resualt[getDocIDs.hashCode])
          title: Text(resualt)
          );
        }
        ); 
      }),
    );
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> matchQuery = [];
    for(var item in docIDs){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
        getDocIDs();
      }
    }
    return FutureBuilder(
      future: getDocIDs(),
      builder: ((context, snapshot) {
        return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index){
        var resualt = matchQuery[index];
        debugPrint(resualt);
        return ListTile(
          // title: GetNhanVien(documentId: docIDs[index], resualt: resualt[index],)
          title: Text(resualt)
          );
          }
        ); 
      }),
    );
  }
}

class GettimeUser extends StatelessWidget {
  final String documentId;
  const GettimeUser({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference nhanviens = FirebaseFirestore.instance.collection('AddNhanvien');
    return FutureBuilder(
      future: nhanviens.doc(documentId).get(),
      builder: ((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          Map<String,dynamic> data = 
          snapshot.data!.data() as Map<String,dynamic>;
          return  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
            children: [
              Container(
                height: 200,
                width: 327,
                decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Row(
                        children: [
                           CircleAvatar(child: Text('${data['designation']}', style: const TextStyle(color: Color(0xffFFFFFF), fontFamily: 'Manrope', fontSize: 20),),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text('${data['name']}', style: const TextStyle(color: Color(0xff22215B), fontFamily: 'Manrope', fontSize: 14),),
                              Text('${data['designation']}', style: const TextStyle(color: Color(0xff9090AD), fontFamily: 'Manrope', fontSize: 14),),
                            ],
                          ),
                        ),
                        ],
                        ),
                        Container(
                          height: 32,
                          width: 43,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 162, 176, 222),
                            borderRadius:BorderRadius.circular(6)),
                          child: Text('${data['id']}',textAlign: TextAlign.center, style: const TextStyle(color: Color(0xffFFFFFF), fontFamily: 'Manrope', fontSize: 20),),
                        )
                      ],
                    ),
                  ],
                ),
              )
              ),
              Positioned(
              top: 65,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                width: 50,
                  decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 249, 249),
              borderRadius: BorderRadius.circular(20)),
              child:Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                      Text('Date', style: TextStyle(color: Color(0xff22215B), fontFamily: 'Manrope', fontSize: 14, fontWeight: FontWeight.bold),),
                      Text('In Time', style: TextStyle(color: Color(0xff22215B), fontFamily: 'Manrope', fontSize: 14,fontWeight: FontWeight.bold),),
                      Text('Out Time', style: TextStyle(color: Color(0xff22215B), fontFamily: 'Manrope', fontSize: 14,fontWeight: FontWeight.bold),),
                     
                     ],
                    ),
                     Container(
                        height: 1,
                        width: 327,
                        color: Colors.grey,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const Text('17 August 2022', style: TextStyle(color: Color(0xff9090AD), fontFamily: 'Manrope', fontSize: 12),),
                      Padding(
                        padding: const EdgeInsets.only(left: 5,right: 50),
                        child: Text('${data['Intime']}', style: const TextStyle(color: Color(0xff9090AD), fontFamily: 'Manrope', fontSize: 12),),
                      ),
                      Text('${data['Outtime']}', style: const TextStyle(color: Color(0xff9090AD), fontFamily: 'Manrope', fontSize: 12),),
                      ],
                      ) 
                      ],
                    ),
                 )
                 )
                 )
                ],
              ),
            );
          }
          return const Text('Loading.....!');
        }
        
      ),
    );
  }
}
