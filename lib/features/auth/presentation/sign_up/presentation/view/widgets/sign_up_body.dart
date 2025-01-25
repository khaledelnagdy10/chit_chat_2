import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_chit_chat/constans.dart';
import 'package:final_chit_chat/core/utils/logo.dart';
import 'package:final_chit_chat/core/utils/services/auth_services.dart';
import 'package:final_chit_chat/core/utils/text_styles.dart';
import 'package:final_chit_chat/core/utils/widgets/custom_button.dart';
import 'package:final_chit_chat/core/utils/widgets/custom_scaffold_messenger.dart';
import 'package:final_chit_chat/core/utils/widgets/custom_text_form_field.dart';
import 'package:final_chit_chat/features/auth/presentation/log_in/presentation/view/log_in_view.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String emailAddress = '';
  String password = '';
  String fullName = '';
  String image = '';

  CollectionReference db = FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
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
            text: 'fullName',
            onChanged: (String value) {
              setState(() {
                fullName = value;
                log(fullName);
              });
            },
          ),
          CustomTextFormField(
            text: 'email',
            onChanged: (String value) {
              setState(() {
                emailAddress = value;
                log(emailAddress);
              });
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
              text: 'SignUp',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  AuthServices().createUserWithEmailAndPassword(
                      emailAddress: emailAddress,
                      password: password,
                      fullName: fullName,
                      context: context);
                  db.add({
                    'email': emailAddress,
                    'password': password,
                    'fullName': fullName,
                  });
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginView();
                  }));
                },
                child: Text(
                  'LogIn ',
                  style: Style.textStyle18.copyWith(color: kPrimaryColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
