import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();  

  Future<void> sendPasswordResetEmail({
    required String email,
    required String employeeId,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email );
  }

  // Future<void> sendEmployeeId({
  //   required String  employeeid ,
  // }) async {
  //   await _firebaseAuth. sendEmployeeId(employeeid :employeeid);
  // }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    required String employeeId,

  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
      // employeeId :employeeId,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String employeeId,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

   Future<void> edit() async {
    // await _firebaseAuth.edit();
  }
}
