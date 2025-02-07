import 'package:final_chit_chat/core/utils/services/auth_services.dart';
import 'package:final_chit_chat/features/auth/presentation/controller/auth_cubit.dart';
import 'package:final_chit_chat/features/auth/presentation/views/auth_view.dart';
import 'package:final_chit_chat/features/home/presentation/views/home_view.dart';
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
      create: (context) => AuthCubit(AuthServices()),
      child: MaterialApp(home: HomeView(homeType: 1)),
    );
  }
}
