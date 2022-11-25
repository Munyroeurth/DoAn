import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/addEmployee.dart';
import 'package:flutter_application_1/Admin/Home/eddSuc.dart';
import 'package:flutter_application_1/Admin/Home/UserSuc.dart';
import 'package:get/get.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

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
        // print('doIDs ${docIDs}');
      },
    ));
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
                                              const AddSuccess()));
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
                /********Position2******/
                Positioned(
                    top: 124,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: 700,
                      height: 700,
                      decoration: const BoxDecoration(
                          color: Color(0xffFAFAFA),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 54,
                                    width: 156,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: '4',
                                        labelText: 'Total Employee',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: SizedBox(
                                      height: 54,
                                      width: 156,
                                      child: ElevatedButton(
                                          onPressed: (() {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddEmployee()));
                                          }),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff567DF4),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Row(
                                            children: const [
                                              Icon(Icons.add),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 9),
                                                child: Text(
                                                  'Add Employee',
                                                  style: TextStyle(
                                                      color: Color(0xffFFFFFF),
                                                      fontFamily: 'Manrope',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                /********Position2******/
                Positioned(
                    top: 232,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
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
                            itemCount: docIDs.length,
                            itemBuilder: ((context, index) {
                              return Column(
                              children: [
                                ListTile(
                                  title: GetNhanVienInformation(documentId: docIDs[index]),
                                ), 
                              ],
                            );
                          }));
                        }),
                        
                      ),
                    )),
                  Padding(
                  padding: const EdgeInsets.only(top: 620, bottom: 8, left: 121, right: 121),
                  child: Container(
                    width: 134,
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xff9090AD),
                      // border: Border.all(
                      //     color: Colors.white,
                      //     width: 1,
                      //     style: BorderStyle.solid),
                      borderRadius:
                          BorderRadius.circular(100),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {

  List<String> docIDs = [];

  Future getDocIDs () async {
    await FirebaseFirestore.instance.collection('AddNhanvien').get().then(
      (snapshot) => snapshot.docs.forEach(
        (document){
        print(document.reference);
        docIDs.add(document.reference.id);
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
  
  @override
  Widget buildResults(BuildContext context) {
   List<String> matchQuery = [];
    for(var item in docIDs){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }else{
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
          title: GetNhanVienInformation(documentId: resualt)
          // title: Text(resualt)
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
      }
    }
    return FutureBuilder(
      future: getDocIDs(),
      builder: ((context, snapshot) {
        return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index){
        var resualt = matchQuery[index];
        return ListTile(
          title: GetNhanVienInformation(documentId: docIDs[index])
          // title: Text(resualt)
          );
        }
        ); 
      }),
    );
  }
}

class GetNhanVienInformation extends StatelessWidget {
  final String documentId;

  GetNhanVienInformation({required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference nhanviens = FirebaseFirestore.instance.collection('AddNhanvien');
    return FutureBuilder<DocumentSnapshot>(
      future: nhanviens.doc(documentId).get(),
      builder:((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = 
          snapshot.data?.data()
           as Map<String, dynamic>;
            return SizedBox(
            height: 56,
            width: 327,
            child: ElevatedButton(
              onPressed: (() {
                print("doumentId ${documentId}");
               Navigator.push(context, MaterialPageRoute(builder: (context)=> UserDetail(documentId)));
              }),
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
                   CircleAvatar(child: Text('${data['id']??''}'),) ,
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${data['name']??''}',
                        textAlign: TextAlign.center,
                         style: const TextStyle(
                            color: Color(0xff22215B),
                            fontSize: 13),),
                        Text('${data['designation']??''}',
                        textAlign: TextAlign.center,
                         style: const TextStyle(
                          color: Color(0xff9090AD),
                          fontSize: 10),
                        ),
                      ],
                     ),
                  ),
                 ),
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
            ),
          );
          
        //  Text('${data['name']}');
        }
        return const Text('loading........');
        
      }));
  }
}
