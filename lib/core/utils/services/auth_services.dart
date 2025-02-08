import 'dart:developer';
import 'package:final_chit_chat/core/data/models/error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  Future<UserCredential> createUserWithEmailAndPassword(
      {required String emailAddress,
      required String password,
      required String fullName}) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return userCredential;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          throw ErrorModel(message: "Weak password");
        } else if (e.code == 'email-already-in-use') {
          throw ErrorModel(message: "email-already-in-use");
        }
      }
    }
    throw ErrorModel(message: 'Unknown error ');
  }

  Future<UserCredential> signUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return userCredential;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-credential') {
          throw ErrorModel(message: 'Wrong email or password');
        }
      }
      throw ErrorModel(message: 'Unknown Error');
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
