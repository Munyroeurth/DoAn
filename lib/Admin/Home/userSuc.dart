
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/employeeList.dart';
 
class UserDetail extends StatefulWidget {

  const UserDetail(String s, {super.key});

  // const UserDetail(String s,{required Key key, required this.id, required this.name, required this.desination, required this.reference, required this.numberphone, required this.workingday, required this.documentId}) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final user = FirebaseAuth.instance.currentUser!;
  //document IDs
  List<String> docIDs = [];
  //get docIDs
  Future getDocIDs () async {
    await FirebaseFirestore.instance.collection('AddNhanvien').get().then(
      (snapshot) => snapshot.docs.forEach(
        (document) { 
        print(document.reference);
        docIDs.add(document.reference.id);
    }));
  }

  deleteData() async {
    // final deletData = await FirebaseFirestore.instance.collection('AddNhanvien').doc(id as String?);
    DocumentReference documentReference = await FirebaseFirestore.instance.collection("AddNhanvien").doc(name);
    documentReference.delete();
  }
  var name, email;

  edit() async {
    // final editData = await FirebaseFirestore.instance.collection('AddNhanvien').doc(id as String?);
    DocumentReference documentReference = await FirebaseFirestore.instance.collection("AddNhanvien").doc(name);
    documentReference.update(
      {
        'Name': name,
        'Email': email,
      } 
    );

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
             child: FutureBuilder(
              future: getDocIDs(),
              builder: ((context, snapshot) {
                return ListView.builder(
                  itemCount: docIDs.length, // docID.lengh
                  itemBuilder: ((context, index) {
                    return Stack(
                  children:[ 
                  Container(
                    height: 610,
                    width: 700,
                    color: Color.fromARGB(255, 231, 231, 231),
                    // child: ListTile(
                    //   title: GetUserInformation(documentId: docIDs[index]),)
                    child:GetUserInformation(documentId: docIDs[index]),
                  ),
                  ]);
                  }),
                );
              }),
             ),
           ),
         ],
       ),
    );
  }
}

class GetUserInformation extends StatelessWidget {
  final String documentId;
   GetUserInformation({required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference nhanviens = FirebaseFirestore.instance.collection('AddNhanvien');
    return FutureBuilder<DocumentSnapshot>(
      future: nhanviens.doc(documentId).get(),
      builder:((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;  
          return Stack(
            children: [
            Column(
              children:[
                Container(
                  height: 800,
                  width: 800,
                  color: const Color(0xff567DF4),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, left: 10, right: 20),
                    child: Column(
                      children:[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                CircleAvatar(child: Text('${data['id']}', style: const TextStyle(color: Color(0xffFFFFFF), fontFamily: 'Manrope', fontSize: 20),),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text('${data['name']}', style: const TextStyle(color: Color(0xffFFFFFF), fontFamily: 'Manrope', fontSize: 20),),
                                      Text('${data['designation']}',  style: const TextStyle(color: Color(0xffFFFFFF), fontFamily: 'Manrope', fontSize: 14),)
                                    ],
                                  ),
                                ),
                                ],
                              ),
                            ),
                             IconButton(onPressed: ((() { 
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const EmployeeList()));
                               })),
                             color: Colors.white,
                              icon: const ImageIcon(AssetImage('Image/wrong.png')))
                          ],
                        ),
                      ],
                    ),
                  ),
                 ),
              ],
            ), 
            Positioned(
            top: 113,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 600,
              width: 700,
              decoration: const BoxDecoration(
                color: Color(0xffE5E5E5),
                borderRadius:BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 34),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                        height: 54,
                        width: 136,
                         child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                            ),
                            hintText: 'Employee Id',
                            labelText: '*****${data['id']}*****',
                          )),
                      ),
                      ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: SizedBox(
                        height: 54,
                        width: 136,
                         child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            hintText: 'Employee Id',
                            labelText: '***${data['id']}****',
                          ),
                         ),
                        ),
                       ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Container(
                      width: 327,
                      height: 136,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius:BorderRadius.circular(20) ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 24, bottom: 24, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Join Date', style: TextStyle(color: Color(0xff22215B), fontFamily: 'Manrope', fontSize: 14, fontWeight: FontWeight.bold),),
                                    Text('Reference', style: TextStyle(color: Color(0xff22215B), fontFamily: 'Manrope', fontSize: 14,fontWeight: FontWeight.bold),),
                                    Text('Contact No', style: TextStyle(color: Color(0xff22215B), fontFamily: 'Manrope', fontSize: 14,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                              Container(
                                height: 1,
                                width: 295,
                                color: const Color(0xff22215B),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 21),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   const Text('joindatetime', style: TextStyle(color: Color(0xff9090AD), fontFamily: 'Manrope', fontSize: 14),),
                                   Text('${data['reference']}', style: const TextStyle(color: Color(0xff9090AD), fontFamily: 'Manrope', fontSize: 14),),
                                   Text('${data['numberphone']}', style: const TextStyle(color: Color(0xff9090AD), fontFamily: 'Manrope', fontSize: 14),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Container(
                      width: 327,
                      height: 136,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius:BorderRadius.circular(20) ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24, right: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('Working day', style: TextStyle(color: Color(0xff22215B), fontFamily: 'Manrope', fontSize: 14,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                              Container(
                                height: 1,
                                width: 295,
                                color: Color(0xff22215B),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 21),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Text('${data['workingday']}', style: const TextStyle(color: Color(0xff9090AD), fontFamily: 'Manrope', fontSize: 14),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24, left: 24, top: 10),
                    child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                             height: 54,
                              width: 136,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              onPressed: (() async {
                                final deletUser = await FirebaseFirestore.instance
                                .collection('AddNhanvien')
                                .doc('wfhlEMdj0VPplhipYZNW');
                                deletUser.delete();
                                print(deletUser);
                              }),
                              child:const Text('Delete') ),
                          ),
                            SizedBox(
                              height: 54,
                              width: 136,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 186, 209, 226),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                                onPressed: (() {
                                   final docUser = FirebaseFirestore.instance
                                    .collection('AddNhanvien')
                                    .doc('wfhlEMdj0VPplhipYZNW');
                                    // Update specific field
                                    docUser.update({
                                      'id' : 'M9',
                                      'name' : 'Deny Hati',
                                      'numberPhone' : '0939298220',
                                      'designation' : 'Mobile Dev',
                                      'workingday' : 'Tuesday-Saturday',
                                      'gender' : 'Male',
                                      'email':'deny@gmail.com',
                                      'password':'deny009',
                                      'reference': 'Anh Long',
                                      // 'wfhlEMdj0VPplhipYZNW' : FieldValue.delete(),// delete some parameter
                                    }).then((value) => print("Data Added successfully"));
                                   
                                }),
                                child:const Text('Edit', style: TextStyle(color: Color(0xff22215B), fontFamily: 'Manrope', fontSize: 14,fontWeight: FontWeight.bold),)),
                            ),
                        ],
                      ),
                    ],
                   ),
                  )
                ],
              )
            ))  
            ],
           );
        }
        return const Text('loading........');
        
      }));
  }
}
