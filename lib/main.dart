import 'package:final_chit_chat/features/auth/data/auth_cubit/auth_cubit.dart';
import 'package:final_chit_chat/features/auth/presentation/sign_up/presentation/view/sign_up_view.dart';
import 'package:final_chit_chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: const MaterialApp(home: SignUpView()),
    );
  }
}
