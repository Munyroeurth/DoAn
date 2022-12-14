import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Admin/Home/addEmployee.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();  

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<AddNhanVien?> signInWithEmailAndPassword({
    required String email,
    required String password, 
    // required String employeeId,
    
  }) async {
    UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    
    );
    var userJson = {};
    await _firestore.collection('AddNhanvien').where('id', isEqualTo: user.user?.uid).get().then((value) {
      userJson = value.docs.first.data();
    });
    return AddNhanVien(
      name: userJson["name"], 
      numberphone: userJson['numberphone'],
      email: userJson['email'],
      pass: userJson['password'],
      designation:userJson['designation'],
      workingday: userJson['workingday'], 
      gender: userJson['gender'],
      reference: userJson['reference']);
    
  }
 final docId =[];//// k có cho commit file len 
  Future<String?> createUserWithEmailAndPassword({
    required String email,
    required String password, 
    // required String employeeId,
  }) async {
    UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user?.uid;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

   Future<void> edit() async {
    // await _firebaseAuth.edit();
  }
}
