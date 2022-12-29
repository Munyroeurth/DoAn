import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Admin/Home/eddSuc.dart';
import 'package:flutter_application_1/Admin/Home/emptyEmployee.dart';
import 'package:flutter_application_1/Admin/Login/SignIn/login/auth.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  bool isVisible = true;
  bool isToggle = true;
  final String Password = '';

 Future postemailpassData() async{
   final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: controllerEmail.text,
    password:controllerPass.text);
 }
  final databaseReference  = FirebaseFirestore.instance;

  final controllerdate = TextEditingController();
  final controllerId = TextEditingController();
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();
  final controllerNumberPhone = TextEditingController();
  final controllerDesignation = TextEditingController();
  final controllerWorkingDay = TextEditingController();
  final controllerGender = TextEditingController();
  final controllerReference = TextEditingController();

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
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const EmptyEmployee()));
                                }),
                                icon: const Icon(Icons.arrow_back),
                                color: const Color(0xffFFFFFF),
                              ),
                              const Text('Add Employee',
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontFamily: 'Manrope',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      ),
                    )),
                /******ADD ROW 1******/
                Positioned(
                    top: 124,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                        height: 688,
                        width: 700,
                        decoration: const BoxDecoration(
                            color: Color(0xffFAFAFA),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 36, left: 24, bottom: 20),
                                  child: Stack(
                                    // alignment: Alignment.centerLeft,
                                    children: [
                                      const CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            AssetImage('Image/Ellipse9.png'),
                                        backgroundColor: Colors.transparent,
                                      ),
                                      Positioned(
                                          left: 40,
                                          top: 60,
                                          child: RawMaterialButton(
                                            onPressed: (() {}),
                                            elevation: 10,
                                            // fillColor: ColorsConst,
                                            child: const Image(
                                                image: AssetImage(
                                                    'Image/changeicon.png')),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 8),
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    // width: 210,color: Colors.red,
                                    color: const Color(0xffFAFAFA),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        /****Joining Date**** */
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: SizedBox(
                                              height: 54,
                                              width: 200,
                                              child: TextField(
                                                controller: controllerdate,
                                                decoration: InputDecoration(
                                                    hintText: '10/10/2020',
                                                    labelText: 'Joining Date',
                                                    suffixIcon: IconButton(
                                                        onPressed: () {},
                                                        icon: IconButton(
                                                            onPressed:
                                                                (() async {
                                                              DateTime? pickeddate = await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  firstDate:
                                                                      DateTime(
                                                                          2000),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2101));
                                                              if (pickeddate !=
                                                                  null) {
                                                                setState(() {
                                                                  controllerdate
                                                                      .text = DateFormat(
                                                                          'dd-MM-yyyy')
                                                                      .format(
                                                                          pickeddate);
                                                                });
                                                              }
                                                            }),
                                                            icon: const ImageIcon(
                                                                AssetImage(
                                                                    'Image/Calendar.png')))),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10))),
                                              ),
                                            )),
                                        /******Employee ID****** */
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: SizedBox(
                                              height: 54,
                                              width: 200,
                                              child: TextField(
                                                controller: controllerId,
                                                decoration: InputDecoration(
                                                    hintText: '1234',
                                                    labelText: 'Employee ID',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10))),
                                              ),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ))),
                /******ADD ROW 2***** */
                Positioned(
                    top: 290,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                        width: 375,
                        height: 606,
                        decoration: const BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 34),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: controllerName,
                                    decoration: InputDecoration(
                                        hintText: 'Mean Theme',
                                        labelText: 'Full Name',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                  /******Mobile Number*****/
                                  Padding(
                                    padding: const EdgeInsets.only(top: 26),
                                    child: TextField(
                                      controller: controllerNumberPhone,
                                      decoration: InputDecoration(
                                          hintText: '+12345678',
                                          labelText: 'Mobile Number',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ),
                                   /********************Password********** */
                                  Padding(
                                    padding: const EdgeInsets.only(top: 26),
                                    child: TextField(
                                      controller: controllerEmail,
                                      decoration: InputDecoration(
                                          hintText: 'Email@gmail.com',
                                          labelText: 'Email',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ),
                                  /*****Email*************** */
                                  Padding(
                                    padding: const EdgeInsets.only(top: 26),
                                    child: TextField(
                                      controller: controllerPass,
                                      obscureText: isVisible,
                                      decoration: InputDecoration(
                                          hintText: 'Password',
                                          labelText: 'Password',
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                isVisible = !isVisible;
                                              });
                                            },
                                            icon: isVisible == true
                                                ? const Icon(Icons.visibility_off)
                                                : const Icon(Icons.visibility)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ),
                                 
                                  /******Designation*****/
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: TextField(
                                      controller: controllerDesignation,
                                      decoration: InputDecoration(
                                          hintText: 'Designer',
                                          labelText: 'Designation',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          suffixIcon: IconButton(
                                            icon: const ImageIcon(
                                                AssetImage('Image/Vector.png')),
                                            onPressed: () {
                                             setState(() {
                                                _showModalDiaDesination(context);
                                             });
                                            },
                                          )),
                                    ),
                                  ),
                                  /*******Working Day******/
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: TextField(
                                      controller: controllerWorkingDay,
                                      decoration: InputDecoration(
                                          hintText: 'Mon, Tue, Wed,Thu,Fri,',
                                          labelText: 'Working day',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          suffixIcon: IconButton(
                                            icon: const ImageIcon(
                                                AssetImage('Image/Vector.png')),
                                            onPressed: () {
                                              _showModalWorkingDay(context);
                                            },
                                          )),
                                    ),
                                  ),
                                  
                                  /********Basic*******/
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 54,
                                          width: 125,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                hintText: '%0.00',
                                                labelText: 'Basic Pay',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                // suffixIcon: IconButton(
                                                //   icon: const ImageIcon(AssetImage('Image/Vector.png')),
                                                //   onPressed: () {},
                                                // )
                                                ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 54,
                                          width: 80,
                                          child: ElevatedButton(
                                              onPressed: (() {}),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xff567DF4),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                              child: const Text(
                                                'Per Day',
                                                style: TextStyle(
                                                    color: Color(0xffFFFFFF),
                                                    fontFamily: 'Manrope',
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 54,
                                          width: 85,
                                          child: ElevatedButton(
                                              onPressed: (() {}),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xffFFFFFF),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                              child: const Text(
                                                'Monthly',
                                                style: TextStyle(
                                                    color: Color(0xff567DF4),
                                                    fontFamily: 'Manrope',
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  /******Gender*******/
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: TextField(
                                      controller: controllerGender,
                                      decoration: InputDecoration(
                                          hintText: 'Male',
                                          labelText: 'Gender',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          suffixIcon: IconButton(
                                            icon: const ImageIcon(
                                                AssetImage('Image/Vector.png')),
                                            onPressed: () {
                                              _showModalGender(context);
                                            },
                                          )),
                                    ),
                                  ),
                                  /********Add Reference*****/
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: TextField(
                                      controller: controllerReference,
                                      decoration: InputDecoration(
                                          hintText: 'Enter Reference',
                                          labelText: 'Add Reference',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          suffixIcon: IconButton(
                                            icon: const ImageIcon(
                                                AssetImage('Image/plus.png')),
                                            onPressed: () {},
                                          )),
                                    ),
                                  ),
                                  /******Save*****/
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: SizedBox(
                                      height: 54,
                                      width: 327,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff567DF4),
                                              // minimumSize: Size(327, 54),
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onPressed: (() {
                                            final user = AddNhanVien(
                                              // joiningdate: DateTime.parse(controllerdate.text),
                                              name: controllerName.text,
                                              numberphone: controllerNumberPhone.text,
                                              email: controllerEmail.text,
                                              pass: controllerPass.text,
                                              designation: controllerDesignation.text, 
                                              workingday: controllerWorkingDay.text, 
                                              gender: controllerGender.text,
                                              reference: controllerReference.text);
                                              createNhanvienUser(user);
                                              postemailpassData();
                                              print('user${user}');
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                       const AddSuccess()));
                                            print('User${user}');
                                          }),
                                          child: const Text(
                                            'Save',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xffFFFCF9),
                                              fontSize: 20,
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                    ),
                                  ),
                                  /******Feet******/
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24, bottom: 8),
                                    child: Container(
                                      width: 134,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff9090AD),
                                        border: Border.all(
                                            color: Colors.white,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // show Modal
  _showModalDiaDesination(context){
  String _value = 'Desination';
  showDialog(
    context: context, 
    builder: (BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 300),
          child: ListView(
            children:[ 
              Column(
              children:[
                const Text('Desination'),
                RadioListTile(title: const Text("Designer"),value: 'Desination', groupValue: _value, onChanged: (value) {
                  setState(() {
                    // if(value = )
                   controllerdate.text=value.toString();
                    _value = value.toString();
                  });
                }),
                 RadioListTile(title: const Text("Developer"),value: 'Developer', groupValue: _value, onChanged: (value) {
                  setState(() {
                    _value = value.toString();
                  });
                  
                }),
                 RadioListTile(title: const Text("Manager"),value: 'Manager', groupValue: _value, onChanged: (value) {
                  setState(() {
                    _value = value.toString();
                  });
                }),
                 RadioListTile(title: const Text("Officer"),value: 'Officer', groupValue: _value, onChanged: (value) {
                  setState(() {
                    _value = value.toString();
                  });
                }),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: (() =>Navigator.pop(context,true)), 
                   child: const Text('Submit')),
                )
              ],
            )]
          ),
        ),
    );
  });
}
// Working Day
_showModalWorkingDay(context){
  String _value1 = 'workingday';
  showDialog(
    context: context, 
    builder: (BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 310),
          child: ListView(
            children: [ Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                const Text('Working day'),
                RadioListTile(title: const Text("Friday"),value: 'Friday', groupValue: _value1, onChanged: (value) {
                   setState(() {
                      _value1= value.toString();
                    });
                }),
                 RadioListTile(subtitle: const Text('Day off'),title: const Text("Saturday"),value: '', groupValue: _value1, onChanged: ((value) {
                   setState(() {
                      _value1= value.toString();
                   });
                 })),
                 RadioListTile(subtitle: const Text('Day off'),title: Text("Sunday"),value: 'Sunday', groupValue: _value1, onChanged: ((value) {
                   setState(() {
                      _value1= value.toString();
                   });
                 })),
                 RadioListTile(title: const Text("Monday"),value: 'Monday', groupValue: _value1, onChanged: ((value) {
                   setState(() {
                      _value1= value.toString();
                     
                   });
                 })),
                RadioListTile(title: const Text("Tuesday"),value: 'Tuesday', groupValue: _value1, onChanged: ((value) {
                  setState(() {
                    _value1= value.toString();
                    
                  });
                })),
                 RadioListTile(title: const Text("Wednesday"),value: 'Wednesday', groupValue: _value1, onChanged: ((value) {
                   setState(() {
                    _value1= value.toString();
                   });
                 })),
                 RadioListTile(title: const Text("Thursday"),value: 'Thursday', groupValue: _value1, onChanged: ((value) {
                   setState(() {
                    _value1= value.toString();
                   });
                 })),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: ElevatedButton(
                    onPressed: (() =>Navigator.pop(context,true)), 
                   child: const Text('Submit')),
                )
              ],
            )]
          ),
        ),
    );
  });
}
// Gender
_showModalGender(context){
  String _value2 = 'Gender';
  showDialog(
    context: context, 
    builder: (BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 300),
          child: Column(
            children:[
              const Text('Gender'),
              RadioListTile(title: const Text("Male"),value: 'Male', groupValue: _value2, onChanged: ((value) {
                 setState(() {
                    _value2 = value.toString();
                  });
              })),
               RadioListTile(title: const Text("Female"),value: 'Female', groupValue:_value2, onChanged: ((value) {
                 setState(() {
                   _value2 = value.toString();
                 });
               })),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: ElevatedButton(
                  onPressed: (() =>Navigator.pop(context,true)), 
                 child: const Text('OK')),
              )
            ],
          ),
        ),
    );
  });
}
}

Future createNhanvienUser(AddNhanVien user) async {
  final userId = await Auth().createUserWithEmailAndPassword(email: user.email, password: user.pass);
  final docUser = FirebaseFirestore.instance.collection('AddNhanvien').doc();
  if(userId != null) {
    user.id = userId ;
    final json = user.toJson();
    await docUser.set(json);
  }
}
//Make class for nhan vien
class AddNhanVien {
  // late final DateTime joiningdate;
  String id;
  late final String name;
  late final String numberphone;
  late final String email;
  late final String pass;
  late final String designation;
  late final String workingday;
  late final String gender;
  late final String reference;
  AddNhanVien({
    // required this.joiningdate,
    this.id = '',
    required this.name,
    required this.numberphone,
    required this.email,
    required this.pass,
    required this.designation,
    required this.workingday,
    required this.gender,
    required this.reference,
  });
  Map<String, dynamic> toJson()=>{
    // 'joiningdate':joiningdate,
    'id':id,
    'name':name,
    'numberphone':numberphone,
    'email':email,
    'password':pass,
    'designation':designation,
    'workingday':workingday,
    'gender':gender,
    'reference': reference ,
    
  };
factory AddNhanVien.fromJson(Map<String,dynamic> json){
    return AddNhanVien(
      id: json['id'] as String,
      name: json['name']  as String, 
      numberphone: json['numberphone'] as String,
      email: json['email'] as String,
      pass: json['password'] as String,
      designation: json['designation'] as String,
      workingday: json['workingday'] as String,
      gender: json['gender'] as String,
      reference: json['reference'] as String,
      // joiningdate: json['joiningdate'] as DateTime ,

      );
      
  }
  toLowerCase() {}
  map(Function(dynamic e) param0) {}
  
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  static const nameRoute = '/Detail';

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}