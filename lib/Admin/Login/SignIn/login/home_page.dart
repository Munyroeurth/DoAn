import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }
  
  Future<void> edit() async {
    await Auth().edit();
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }
 final docId =[];//// k có cho commit file len 
  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,   
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _userUid(),
              _signOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
