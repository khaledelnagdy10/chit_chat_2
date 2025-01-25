import 'package:final_chit_chat/features/auth/presentation/sign_up/presentation/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(child: SafeArea(child: SignUpBody())));
  }
}
