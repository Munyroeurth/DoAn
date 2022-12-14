import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/editifor.dart';

import 'employeeList.dart';

class PassData extends StatefulWidget {
  String name;
  String designation;
  String id;
  String email;
  String reference;
  String numberphone;
  String workingday;
  // PassData({Key? mykey, required this.id}) : super(key: mykey);
    PassData({
      required this.name,
      required this.designation,
      required this.id,
      required this.email,
      required this.numberphone,
      required this.reference,
      required this.workingday,
       super.key});

  @override
  State<PassData> createState() => _PassDataState();
}

class _PassDataState extends State<PassData> {
  
  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('AddNhanvien').snapshots();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staff Informations')),
      body: SingleChildScrollView(
        child: Container(
          height: 580,
          width: 530,
          color: const Color(0xffFAFAFA),
          child: Stack(
            children:[ 
              Container(
                height: 500,
                width: 500,
                decoration: const BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
                child: Padding(
                  padding:  const EdgeInsets.only(top: 20, left: 20),
                  child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                     Row(
                      children: [
                      CircleAvatar(backgroundColor: Colors.red,child: Text(widget.designation),),
                      Column(
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(widget.name),
                        ),
                        Text(widget.designation),
                            ],
                           ),
                          ],
                        ),
                         IconButton(onPressed: (() {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const EmployeeList()));
                        }),
                         icon: const Icon(Icons.close)),
                      ], 
                    ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 500,
                  width: 500,
                  decoration: const BoxDecoration(
                  color: Color(0xffE5E5E5),
                  borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )),
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
                      // itemCount: data.size,
                      itemCount: 1,
                      itemBuilder: ((context, index) {
                        return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                            height: 54,
                            width: 136,
                             child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                                ),
                                hintText: widget.id,
                                labelText: 'Id',
                              )),
                             ),
                               SizedBox(
                                height: 54,
                                width: 136,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                    ),
                                    hintText: widget.email,
                                    labelText: 'email',
                                  )),
                                ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                                         Text(widget.reference, style: const TextStyle(color: Color(0xff9090AD), fontFamily: 'Manrope', fontSize: 14),),
                                         Text(widget.numberphone, style: const TextStyle(color: Color(0xff9090AD), fontFamily: 'Manrope', fontSize: 14),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          ),
                        ),
                        Container(
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
                                     Text(widget.workingday, style: const TextStyle(color: Color(0xff9090AD), fontFamily: 'Manrope', fontSize: 14),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: Row(
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
                                    .doc(widget.id);
                                    // .doc('5nJ8KN3nN6tVY4jMMdXr');
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditInforNV(
                                        designation:data.docs[index]['designation'],
                                        email: data.docs[index]['email'],
                                        id: data.docs[index]['id'],
                                        name:data.docs[index]['name'],
                                        pass: data.docs[index]['password'],
                                        reference: data.docs[index]['reference'],
                                        workingday: data.docs[index]['workingday'],
                                      )));
                                      //  final docUser = FirebaseFirestore.instance
                                      //   .collection('AddNhanvien')
                                      //   .doc('5nJ8KN3nN6tVY4jMMdXr');
                                      //   // Update specific field
                                      //   docUser.update({
                                      //     'id' : 'M9',
                                      //     'name' : 'Deny Hati',
                                      //     'numberphone' : '0939298220',
                                      //     'designation' : 'MB',
                                      //     'workingday' : 'Tuesday-Saturday',
                                      //     'gender' : 'Male',
                                      //     'email':'deny@gmail.com',
                                      //     'password':'deny009',
                                      //     'reference': 'Anh Long',
                                      //     // 'wfhlEMdj0VPplhipYZNW' : FieldValue.delete(),// delete some parameter
                                      //   }).then((value) => print("Data Added successfully"));
                                       
                                    }),
                               child:const Text('Edit', style: TextStyle(color: Color(0xff22215B), fontFamily: 'Manrope', fontSize: 14,fontWeight: FontWeight.bold),)),
                              ),
                            ],
                          ),
                        ),
                       ],
                      ));
                    }));
                    }
                  ))
                )
              )
            ]
          ),
        ),
      ),
    );
  }
}
