import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/User/Login/Home/AttendRequest.dart';
import 'package:flutter_application_1/User/Login/Home/PhiChiLuong.dart';
import 'package:flutter_application_1/User/Login/Home/qrcode/homeqrcodeScreen.dart';
import 'package:flutter_application_1/User/Login/Home/signInUpUser/auth.dart';
import 'package:flutter_application_1/User/Login/signUpUser.dart';
import 'package:flutter_application_1/src/API/API_DIO/Post/PostDio.dart';
import 'package:flutter_application_1/src/widget/linearprogressbar.dart';



class HRMUserScreen extends StatefulWidget {
  const HRMUserScreen({super.key});
  @override
  State<HRMUserScreen> createState() => _HRMUserScreenState();
}

const BackgrnColor = Color(0xff567DF4);

class _HRMUserScreenState extends State<HRMUserScreen> {

  final nhanvien = FirebaseAuth.instance.currentUser!;

  List<String> docIDs = [];
   // Get docIDs
   Future getDocIDs () async {
     final res = await FirebaseFirestore.instance.collection('AddNhanvien').get().then(
      (QuerySnapshot snapshot) => snapshot.docs.forEach(
        (DocumentSnapshot doc){
        print(doc.data);
        // print(doc.documentID);
        // print(document.reference);
        // docIDs.add(document.reference.id);
        // print('doIDs ${docIDs}');
      },
    ));
   }
  @override 
  void initState(){
    getDocIDs();
    super.initState();
  }
  //  PlatformFile? pickedFiles;
  //  UploadTask? uploadTask;
  //  Future selectFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if(result == null) return;
  //   setState(() {
  //     pickedFiles = result.files.first;
  //   });
  //  }

  //  Future UploadFile () async {
  //   final path = 'files/${pickedFiles!.name}';
  //   // final file = File(pickedFiles!.path!);

  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   setState(() {
  //   //  uploadTask = ref.putFile(file);
  //  });
  //   final snapshot = await uploadTask!.whenComplete((){

  //   });
  //   final urlDownload = await snapshot.ref.getDownloadURL();
  //   print('Download Link: $urlDownload');
  //   setState(() {
  //     uploadTask = null;
  //   });
  //  }

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
    print("Sign Out");
  }
  Future<void> edit() async {
    await Auth().edit();
  }

  bool notification = true;

  Widget _userNam() {
    return Text(user?.email ?? 'User Email', style: const TextStyle(fontSize: 14),);
  }

  Widget _signOutButton() {
  return SizedBox(
    height: 53,
    width: 400,
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff567DF4),
      // minimumSize: Size(327, 54),
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10))),
      onPressed: (() {
        signOut();
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpUser()));
      }),
      child: const Text('Sign Out', style: TextStyle(fontSize: 20),),
    ),
  );
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
                    width: 375,
                    height: 812,
                    decoration: const BoxDecoration(
                      color: BackgrnColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 44),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Text(
                                        'HRM& \nPayroll Managerment,',
                                        style: TextStyle(
                                            color: Color(0xffFFFFFF),
                                            fontFamily: 'Manrope',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: IconButton(
                                    onPressed: (() {
                                    setState(() {
                                      _ProfileModal(context);
                                    });
                                    }),
                                    icon: const Icon(Icons.menu),
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                Positioned(
                    top: 128,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                        width: 200,
                        height: 300,
                        decoration: const BoxDecoration(
                            color: Color(0xffE5E5E5),
                            // border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        /******BODY*********/
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /********BODY1**********/
                                    Container(
                                        width: 135,
                                        height: 128,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // border: Border.all(
                                          //     color: Colors.grey, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 128,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff9E8EFE),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            /******EmPloyee Management*****/
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                                top: 16,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xff9E8EFE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                      child: TextButton(
                                                          onPressed: (() {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const PostDio()));
                                                          }),
                                                          child: const Image(
                                                              image: AssetImage(
                                                                  'Image/business.png'))),
                                                    ),
                                                  ),
                                                 Padding(
                                                   padding: const EdgeInsets.only(left: 16, top: 12),
                                                   child: _userNam(),
                                                 ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                    /********BODY1**********/
                                    Container(
                                        width: 135,
                                        height: 128,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // border: Border.all(
                                          //     color: Colors.grey, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 128,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xffFD72AF),
                                                  // border: Border.all(color: Colors.grey, width: 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            /********HRM*****/
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                                top: 16,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xffFD73B0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                      child: TextButton(
                                                          onPressed: (() {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const AttendRequest()));
                                                          }),
                                                          child: const Image(
                                                              image: AssetImage(
                                                                  'Image/calculator.png'))),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16, top: 12),
                                                    child: Text(
                                                      'Attend Request',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff22215B),
                                                          fontFamily: 'Manrope',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              /******BODY2*******/
                              Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /********BODY2**********/
                                    Container(
                                        width: 135,
                                        height: 128,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // border: Border.all(
                                          //     color: Colors.grey, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 128,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff4ACDF9),
                                                  // border: Border.all(color: Colors.grey, width: 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                                top: 16,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xff4CCEFA),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                      child: TextButton(
                                                          onPressed: (() {
                                                             Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const QrCodeScreen()));
                                                          }),
                                                          child: const Image(
                                                              image: AssetImage(
                                                                  'Image/receipt.png'))),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16, top: 12),
                                                    child: Text(
                                                      'Chấm Công\nvới QRCode',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff22215B),
                                                          fontFamily: 'Manrope',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                    /********BODY2**********/
                                    Container(
                                        width: 135,
                                        height: 128,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // border: Border.all(
                                          //     color: Colors.grey, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 128,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff02B984),
                                                  // border: Border.all(color: Colors.grey, width: 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                                top: 16,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xff04B985),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                      child: TextButton(
                                                          onPressed: (() {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const PhieuLuong()));
                                                          }),
                                                          child: const Image(
                                                              image: AssetImage(
                                                                  'Image/folder.png'))),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16, top: 12),
                                                    child: Text(
                                                      'Phiếu Chi Lương',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff22215B),
                                                          fontFamily: 'Manrope',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                 
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: _signOutButton(),
                                ),
                            ],
                          ),
                        ))),
               
              ],
            ),
          )
        ],
      ),
    );
  }


_ProfileModal(context,){
  String value = 'profile';
  showDialog(context: context,
  builder: (BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)),
        child:Stack(
          children:[ 
            Container(
            width: 700,
            height: 800,
            decoration: const BoxDecoration(
              color: Color(0xffFAFAFA),
            ),
            // constraints: BoxConstraints(maxHeight: 300),
            child: Padding(
              padding: const EdgeInsets.only(top:280),
              child: ListView(
                children:[ 
                  Column(
                  children: [
                  SizedBox(
                    height: 50, width: 400,
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffFAFAFA)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LinearProgressBar()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.settings,color: Color(0xff9090AD),),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: Text('Setting', style: TextStyle(color: Color(0xff22215B)),),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios,color: Color(0xff9090AD),)
                      ],
                    ),),
                  ),
                  /******APP LOCK******/
                   SizedBox(
                    height: 50, width: 400,
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffFAFAFA)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.lock_outline_rounded,color: Color(0xff9090AD),),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: Text('App Lock', style: TextStyle(color: Color(0xff22215B)),),
                            ),
                          ],
                        ),
                        Switch(
                        activeColor: Colors.blue,
                        value: notification,
                        onChanged:(value){
                          setState(() {
                            notification = value;
                          });
                        }),
                      ],
                    ),),
                  ),
                  /******Share With Friends**** */
                   SizedBox(
                    height: 50, width: 400,
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffFAFAFA)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.person_outline_sharp,color: Color(0xff9090AD),),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: Text('Share With Friends', style: TextStyle(color: Color(0xff22215B)),),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios,color: Color(0xff9090AD),)
                      ],
                    ),),
                  ),
                  /********Privacy Policy****** */
                   SizedBox(
                    height: 50, width: 400,
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffFAFAFA)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.privacy_tip_sharp,color: Color(0xff9090AD),),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: Text('Privacy Policy', style: TextStyle(color: Color(0xff22215B)),),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios,color: Color(0xff9090AD),)
                      ],
                    ),),
                  ),
                  /*******Log Out*******/
                   SizedBox(
                    height: 50, width: 400,
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffFAFAFA)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.logout_outlined, color: Color(0xff9090AD),),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: Text('Log Out', style: TextStyle(color: Color(0xff22215B)),),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios,color: Color(0xff9090AD),)
                      ],
                    ),),
                  ),
                   SizedBox(
                    height: 50, width: 400,
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffFAFAFA)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.person_outline_sharp,color: Color(0xff9090AD),),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: Text('Share With Friends', style: TextStyle(color: Color(0xff22215B)),),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios,color: Color(0xff9090AD),)
                      ],
                    ),),
                  ),
                   SizedBox(
                    height: 50, width: 400,
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffFAFAFA)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.person_outline_sharp,color: Color(0xff9090AD),),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: Text('Share With Friends', style: TextStyle(color: Color(0xff22215B)),),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios,color: Color(0xff9090AD),)
                      ],
                    ),),
                  )
                  ],
                )]
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 300,
            child: Container(
              height: 100,
              width: 100,
               decoration: const BoxDecoration(
              color: Color.fromARGB(255, 65, 121, 232),
               borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)
              )),
              child: Padding(
                padding: const EdgeInsets.only(top: 190),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Position', style: TextStyle(color: Color(0xffFAFAFA)),),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: Container(height: 1,width: 100, color: const Color(0xffFAFAFA),),
                    ),
                    const Text('Mobile Developer', style: TextStyle(color: Color(0xffFAFAFA))),
                  ],
                ),
              ),
              )),
            Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 400,
            child: Container(
              height: 100,
              width: 100,
               decoration: const BoxDecoration(
              color: Color.fromARGB(255, 251, 249, 249),
               borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)
              )
            ),
              child: Padding(
                padding:  const EdgeInsets.only(top: 10),
                child: Expanded(
                  child: Column(
                    children: const [
                    // if(pickedFiles !=null)
                       SizedBox(
                      height: 100,
                      width: 100,
                       child: CircleAvatar(
                       backgroundColor: Color.fromARGB(255, 55, 59, 57),
                       radius: 100,
                       backgroundImage: AssetImage('Image/profile.png'),
                       // backgroundImage: AssetImage('pickedFile!.name'),
                       // child: Image.file(
                       //   File(pickedFiles?.path),
                       //   width: double.infinity,
                       //   fit: BoxFit.cover,
                       // ),
                      ),
                      ),//CircleA ,)
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Nguyễn Anh Tuấn'),
                      ),
                      // const ElevatedButton(onPressed: null, child: Text('Select file')),
                      // ElevatedButton(onPressed: UploadFile, child: const Text('Upload file')),
                      // buildProgress(),
                    ],
                  ),
                ),
              ),
            ))
        ]),
    );
  });
}
}

// Widget buildProgress()=> StreamBuilder<TaskSnapshot>(
//   stream: UploadTask.snapshotEvents,
//   builder:((context, snapshot){
//     if(snapshot.hasData){
//       final data = snapshot.data;
//       double progress = data?.bytesTransferred! / data!.totalBytes;
//       return SizedBox(
//         height: 50,
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             LinearProgressIndicator(
//               value: progress,
//               backgroundColor: Colors.green,
//               color: Colors.grey,
//             ),
//             Center(
//               child: Text('${(100*progress).roundToDouble()}%',
//               style: const TextStyle(color: Colors.white)),
//             )
//           ],
//         ),
//       );

//     }else{
//       return const SizedBox(height: 50,);
//     }
//   }));


class ProfileNV extends StatelessWidget {
  final String profileId;
   ProfileNV({required this.profileId});

  @override
  Widget build(BuildContext context) {
    CollectionReference profile = FirebaseFirestore.instance.collection('AddNhanvien');
    return FutureBuilder<DocumentSnapshot>(
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
          
        }
        return const Text('loading........');
      })
      );
  }
}


