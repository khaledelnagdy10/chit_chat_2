import 'package:final_chit_chat/core/utils/constants.dart';
import 'package:final_chit_chat/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.leadingIconButton,
    required this.actionButton,
    required this.title,
  });
  final IconButton leadingIconButton;
  final String title;
  final IconButton actionButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: AppBar(
        backgroundColor: kPrimaryColor,
        leading: leadingIconButton,
        title: Center(
          child: Text(
            title,
            style: Style.textStyleBold35White,
          ),
        ),
        actions: [actionButton],
      ),
    );
  }
}
