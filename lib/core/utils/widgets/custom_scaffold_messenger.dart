import 'package:flutter/material.dart';

void customScaffoldMessenger(BuildContext context,
    {required String message, required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
  ));
}
