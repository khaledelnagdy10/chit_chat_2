import 'package:final_chit_chat/features/auth/presentation/log_in/presentation/widgets/log_in_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Expanded(
      child: SingleChildScrollView(
        child: SafeArea(
          child: LoginBody(),
        ),
      ),
    ));
  }
}
