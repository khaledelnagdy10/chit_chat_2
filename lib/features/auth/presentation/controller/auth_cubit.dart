import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_chit_chat/core/data/models/error_model.dart';
import 'package:final_chit_chat/core/utils/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthServices authServices;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('user');

  AuthCubit(this.authServices) : super(AuthInitial());

  Future<void> signUp({
    required String fullName,
    required String emailAddress,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await authServices.createUserWithEmailAndPassword(
        fullName: fullName,
        emailAddress: emailAddress,
        password: password,
      );

      collectionReference.add(
          {'email': emailAddress, 'fullName': fullName, 'password': password});

      //  final user = userCredential.user;
      // log('${user?.uid}');

      emit(AuthSuccess());
    } on ErrorModel catch (e) {
      emit(AuthFailure(errorModel: e));
    }
  }

  Future<void> signIn({
    required String emailAddress,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await authServices.signUserWithEmailAndPassword(
          emailAddress: emailAddress, password: password);

      emit(AuthSuccess());
    } on ErrorModel catch (e) {
      emit(AuthFailure(errorModel: e));
    }
  }
}
