import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class apicall extends StatefulWidget {
  const apicall({super.key});

  @override
  State<apicall> createState() => _apicallState();
}

class _apicallState extends State<apicall> {
  List<dynamic> _user = [];
  bool _laoding = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('API CALL')),
      body:_user.isNotEmpty? //User List is no empty, we will show list 
      ListView.builder(itemBuilder:(context, index) {
        return Card(child: Row(
          children: [
            Image.network(_user[index]['image']),
            Column(
              children: [
                Text(_user[index]['firstName']),
                Text(_user[index]['email']),
                Text(_user[index]['phone']),
              ],
            )
          ],
        ),);
        
      })
      :Container(
        child: Center(
          child: _laoding? // show progress when show loading
           CircularProgressIndicator() : ElevatedButton(
            onPressed: (){
              loadUserList();
            }, 
            child:Text('Call API')),
        ),
      )
    );
  }
  void loadUserList() async {
    setState(() {
      _laoding = true;
    });
    var res = await http.get(Uri.https('dummyjson.com',"User"));
    if(res.statusCode == 200){
      var jsonData = jsonDecode(res.body);
      setState(() {
         _user = jsonData['users'];
         _laoding = false;
      });
     
      // print(res);
    }
  }
}