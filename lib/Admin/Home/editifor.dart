import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/Home/employeeList.dart';

class EditInforNV extends StatefulWidget {
  String name;
  String designation;
  String id;
  String email;
  String reference;
  String pass;
  String workingday;

   EditInforNV({
    required this.name,
    required this.designation,
    required this.id,
    required this.email,
    required this.pass,
    required this.reference,
    required this.workingday,
    super.key});

  @override
  State<EditInforNV> createState() => _EditInforNVState();
}

class _EditInforNVState extends State<EditInforNV> {

    // final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('AddNhanvien').snapshots();

    // final TextEditingController _name = TextEditingController();
    // final TextEditingController _numberphone = TextEditingController();
    // final TextEditingController _email = TextEditingController();
    // final TextEditingController _password = TextEditingController();
    // final TextEditingController _workingday = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Staff Information')),
      body: SingleChildScrollView(
        child: Container(
          width: 500,
          height: 560,
           child: Stack(
            children: [
              Container(
                height: 540,
                width: 570,
                decoration: const BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius:BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                    Container(
                      height: 100,
                      width: 336,
                      decoration:  BoxDecoration(
                      color: const Color.fromARGB(255, 224, 221, 221),
                      borderRadius:BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  const [
                                Text('Name'),
                                Text('Designation'),
                                Text('Workingday'),
                              ],
                            ),
                            Container(height: 2, color: Colors.black,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.name),
                                CircleAvatar(backgroundColor: Colors.purpleAccent, child: Text(widget.designation),),
                                Text(widget.workingday)
                              ],
                            )
                          ],
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0, bottom: 10),
                      child: Container(
                        height: 100,
                        width:336,
                        decoration:  BoxDecoration(
                        color: const Color.fromARGB(255, 224, 221, 221),
                        borderRadius:BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Email'),
                                  Text('IDs'),
                                  Text('Password'),
                                
                                ],
                              ),
                              Container(height: 2, color: Colors.black,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  Text(widget.email),
                                  Text(widget.id),
                                  Text(widget.pass),
                                  
                                ],
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                    SizedBox(
                    height: 45,
                    width: 336,
                    child: TextField(
                      // controller: _name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                        ),
                        // hintText: widget.name,
                        labelText: 'Name',
                        
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: SizedBox(
                      height: 45,
                      width: 336,
                      child: TextField(
                        // controller: _numberphone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                          ),
                          // hintText: widget.email,
                          labelText: 'Email',
                        )),
                      ),
                    ),
                    SizedBox(
                    height: 45,
                    width: 336,
                    child: TextField(
                      // controller: _email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                        ),
                        // hintText: widget.pass,
                        labelText: 'Password',
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom:10),
                      child: SizedBox(
                      height: 45,
                      width: 336,
                      child: TextField(
                        // controller:_password ,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                          ),
                          // hintText: widget.workingday,
                          labelText: 'working days',
                        )),
                      ),
                    ),
                    // SizedBox(
                    // height: 54,
                    // width: 336,
                    // child: TextField(
                    //   // controller: _workingday,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(10)
                    //     ),
                    //     hintText: widget.reference,
                    //     labelText: 'Reference',
                    //   )),
                    // ),

                    //button
                     Padding(
                       padding: const EdgeInsets.only(top: 10),
                       child: SizedBox(
                        height: 45,
                        width: 136,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 186, 209, 226),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                          onPressed: (() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const EmployeeList()));
                              final docUser = FirebaseFirestore.instance
                              .collection('AddNhanvien')
                              .doc('0ttknBHP1J2GNTulu4c2');
                              // Update specific field
                              docUser.update({
                                'id' : 'M9',
                                'name' : 'Hati',
                                'numberPhone' : '0939298220',
                                'designation' : 'MB',
                                'workingday' : 'Tuesday-Saturday',
                                'gender' : 'Male',
                                'email':'deny@gmail.com',
                                'password':'deny009',
                                'reference': 'Anh Long',
                                // 'wfhlEMdj0VPplhipYZNW' : FieldValue.delete(),// delete some parameter
                              }).then((value) => print("Data Added successfully")); 
                          }),
                          child:const Text('Sumit', style: TextStyle(color: Color(0xff22215B), fontFamily: 'Manrope', fontSize: 20,fontWeight: FontWeight.bold),)),
                        ),
                     ),
                    ],
                  ),
                ),
              ),
            ],
           ),

        ),
      ),
    );
  }
}