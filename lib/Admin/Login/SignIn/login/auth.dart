import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();  

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<String?> createUserWithEmailAndPassword({
    required String email,
    required String password,
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
 final docId =[];//// k có cho commit file len 