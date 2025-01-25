import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_chit_chat/core/utils/widgets/custom_scaffold_messenger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  Future<void> createUserWithEmailAndPassword(
      {required BuildContext context,
      required String emailAddress,
      required String password,
      required String fullName}) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      customScaffoldMessenger(
          context: context, message: 'Successfully', color: Colors.green);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        customScaffoldMessenger(
            context: context,
            message: 'Weak Password make it has letters & numbers',
            color: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        customScaffoldMessenger(
            context: context,
            message: 'email-already-in-use',
            color: Colors.red);
      }
    } catch (e) {
      customScaffoldMessenger(
          context: context, message: 'unKnown error ', color: Colors.red);
    }
  }

  Future<void> signUserWithEmailAndPassword({
    required BuildContext context,
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      customScaffoldMessenger(
          context: context, message: 'Successfully', color: Colors.green);

      final userDoc = await FirebaseFirestore.instance
          .collection('user')
          .doc(credential.user!.uid)
          .get();
      if (!userDoc.exists) {
        customScaffoldMessenger(
            context: context,
            message: 'The Account is not exist',
            color: Colors.red);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        customScaffoldMessenger(
            context: context, message: 'user-not-found', color: Colors.red);
      } else if (e.code == 'wrong-password') {
        customScaffoldMessenger(
            context: context, message: 'wrong-password', color: Colors.red);
      }
    }
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      log('logout');
    } catch (e) {
      log('there was an error');
    }
  }
}
