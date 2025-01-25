import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_chit_chat/constans.dart';
import 'package:final_chit_chat/core/utils/logo.dart';
import 'package:final_chit_chat/core/utils/services/auth_services.dart';
import 'package:final_chit_chat/core/utils/text_styles.dart';
import 'package:final_chit_chat/core/utils/widgets/custom_button.dart';
import 'package:final_chit_chat/core/utils/widgets/custom_text_form_field.dart';
import 'package:final_chit_chat/features/auth/data/auth_cubit/auth_cubit.dart';
import 'package:final_chit_chat/features/home/presentaion/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/widgets/custom_scaffold_messenger.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  String emailAddress = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const CircularProgressIndicator();
          }

          if (state is AuthFailure) {
            customScaffoldMessenger(
                context: context, message: state.errMess, color: Colors.red);
          }

          if (state is AuthSuccess) {
            return const HomeView();
          }
          return Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Groupie',
                    style: Style.textStyleBold35,
                  ),
                ],
              ),
              Text(
                'Login now to see what they are talking!',
                style: Style.textStyle18.copyWith(color: Colors.grey[700]),
              ),
              const Logo(),
              CustomTextFormField(
                text: 'email',
                onChanged: (String value) {
                  emailAddress = value;
                  log(emailAddress);
                },
              ),
              CustomTextFormField(
                text: 'password',
                onChanged: (String value) {
                  password = value;
                  log(password);
                },
              ),
              SizedBox(
                width: 370,
                child: CustomButton(
                  text: 'LogIn',
                  onPressed: () async {
                    AuthServices().signUserWithEmailAndPassword(
                      context: context,
                      emailAddress: emailAddress,
                      password: password,
                    );

                    BlocProvider.of<AuthCubit>(context).authCubit(context,
                        emailAddress: emailAddress, password: password);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'I already have an account\t ',
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'SignUp ',
                      style: Style.textStyle18.copyWith(color: kPrimaryColor),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
