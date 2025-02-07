import 'dart:developer';

import 'package:final_chit_chat/core/utils/constants.dart';
import 'package:final_chit_chat/core/utils/logo.dart';
import 'package:final_chit_chat/core/utils/text_styles.dart';
import 'package:final_chit_chat/core/utils/widgets/custom_button.dart';
import 'package:final_chit_chat/core/utils/widgets/custom_scaffold_messenger.dart';
import 'package:final_chit_chat/features/auth/presentation/controller/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key, required this.authType});
  final int authType;
  final GlobalKey<FormState> formKey = GlobalKey();
  String emailAddress = '';
  String password = '';
  String fullName = '';
  String image = '';
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          log(state.errorModel.message);
          customScaffoldMessenger(
            context,
            message: state.errorModel.message,
            color: Colors.red,
          );
        }
        if (state is AuthSuccess) {
          customScaffoldMessenger(
            context,
            message: 'successfully',
            color: Colors.green,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: authType == 0 ? const Text('Register') : const Text('Login'),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: formKey,
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Groupie',
                    style: Style.textStyleBold35Black,
                  ),
                ],
              ),
              Text(
                authType == 0
                    ? 'Register now to join the conversation!'
                    : 'Login now to see what they are talking!',
                style: Style.textStyle18Black.copyWith(color: Colors.grey[700]),
              ),
              const Logo(),
              if (authType == 0)
                CustomTextFormField(
                  text: 'fullName',
                  onChanged: (String value) {
                    fullName = value;
                  },
                ),
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
                  text: authType == 0 ? 'SignUp' : 'LogIn',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().authServices;
                      authType == 0
                          ? context.read<AuthCubit>().signUp(
                              fullName: fullName,
                              emailAddress: emailAddress,
                              password: password)
                          : context.read<AuthCubit>().signIn(
                              emailAddress: emailAddress, password: password);
                    }
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AuthView(authType: authType == 0 ? 1 : 0)));
                    },
                    child: Text(
                      authType == 0 ? 'LogIn ' : 'SignUp',
                      style:
                          Style.textStyle18White.copyWith(color: kPrimaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
