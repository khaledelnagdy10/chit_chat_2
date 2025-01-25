import 'package:bloc/bloc.dart';
import 'package:final_chit_chat/core/utils/services/auth_services.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> authCubit(BuildContext context,
      {required String emailAddress, required String password}) async {
    emit(AuthLoading());
    try {
      await AuthServices().signUserWithEmailAndPassword(
          context: context, emailAddress: emailAddress, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errMess: e.toString()));
    }
  }
}
