import 'dart:developer';
import 'package:final_chit_chat/core/data/models/error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  Future<void> createUserWithEmailAndPassword(
      {required String emailAddress,
      required String password,
      required String fullName}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ErrorModel(message: "Weak password");
      } else if (e.code == 'email-already-in-use') {
        throw ErrorModel(message: "email-already-in-use");
      }
    } catch (e) {
      throw ErrorModel(message: "Unknown error");
    }
  }

  Future<void> signUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      log('Firebase sign-in successful');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw ErrorModel(message: 'invalid-credential');
      }
    }
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      log('logout');
    } on ErrorModel catch (e) {
      throw ErrorModel(message: e.toString());
    }
  }
}
