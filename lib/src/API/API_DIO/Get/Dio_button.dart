import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DioButton extends StatefulWidget {

   DioButton({super.key});

  @override
  State<DioButton> createState() => _DioButtonState();
}

class _DioButtonState extends State<DioButton> {
  String _response = 'No Data yet';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700,
        width: 700,
        child: Center(
            child: Column(
          children: [
          
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  // getHTTP();
                  getDio();
                },
                child: const Text(" HTTP Request (GET) "),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 196, 193, 186),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                            const CircleAvatar(
                              backgroundColor: Colors.amber,),
                            Text(_response),
                            // Text('Name: $getApi')
                            ],
                          )
                          
                        ],
                      );
                    }),
                    // children: [
                    //   Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Text(_response),
                    //   )
                    //   // Image(image: AssetImage(_response)),
                    // ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (() {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Color.fromARGB(255, 104, 134, 211),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
                child: Text('ButtonModal')),
          ],
        )),
      ),
    );
  }

  // void getHTTP() async {
  //   try {
  //     // var url = ('https://jsonplaceholder.typicode.com/todos/');
  //     final response = await http
  //     .get('https://fakemyapi.com/api/fake?id=220e0e14-8c78-45e9-9ef0-6ca516fde5be' as Uri);
  //     print(response.body);
  //     print(response.statusCode);
  //     _response = response.body;
  //   } catch (error) {
  //     _response = 'Error Occurred : $error';
  //   } finally {
  //     setState(() {});
  //   }
  // }

  void getDio() async {
    try {
      var response = await Dio()
          // .get('https://jsonplaceholder.typicode.com/posts/1/comments');
          .get('https://fakemyapi.com/api/fake?id=220e0e14-8c78-45e9-9ef0-6ca516fde5be');
      print(response.statusCode);
      print(response.toString());
      print(response.headers);
      print(response.requestOptions);
      _response = response.toString();
      print(response);
    } catch (e) {
      print(e);
    } finally {
      setState(() {});
    }
  }
}

class testApi {
  late int userId;
  late int id;
  late String title;
  late bool completed;

  testApi({required this.userId, required this.id, required this.title, required this.completed});

  testApi.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}

class getApi {
  late String firstAme;
  late String lastName;
  late String photo;
  late String email;
  late String title;
  late String jobType;
  late List<String> telephone;
  late Address address;
  late List<Friends> friends;

  getApi(
      {required this.firstAme,
      required this.lastName,
      required this.photo,
      required this.email,
      required this.title,
      required this.jobType,
      required this.telephone,
      required this.address,
      required this.friends});

  getApi.fromJson(Map<String, dynamic> json) {
    firstAme = json['first_ame'];
    lastName = json['last_name'];
    photo = json['photo'];
    email = json['email'];
    title = json['title'];
    jobType = json['job_type'];
    telephone = json['telephone'].cast<String>();
    address =
        (json['address'] != null ? new Address.fromJson(json['address']) : null)!;
    if (json['friends'] != null) {
      friends = <Friends>[];
      json['friends'].forEach((v) {
        friends.add(new Friends.fromJson(v));
      });
      print(friends);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_ame'] = this.firstAme;
    data['last_name'] = this.lastName;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['title'] = this.title;
    data['job_type'] = this.jobType;
    data['telephone'] = this.telephone;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.friends != null) {
      data['friends'] = this.friends.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  late String zipCode;
  late String street;
  late String city;
  late String country;

  Address({required this.zipCode, required this.street, required this.city, required this.country});

  Address.fromJson(Map<String, dynamic> json) {
    zipCode = json['zip_code'];
    street = json['street'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zip_code'] = this.zipCode;
    data['street'] = this.street;
    data['city'] = this.city;
    data['country'] = this.country;
    return data;
  }
}

class Friends {
  late String firstName;
  late String lastName;
  late String email;

  Friends({required this.firstName, required this.lastName, required this.email});

   Friends.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}
