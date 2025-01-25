import 'package:final_chit_chat/core/utils/assest.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.2 / 1, child: Image.asset(Assest.chatAppLogo));
  }
}
