import 'package:final_chit_chat/features/home/presentaion/widgets/custom_floating_action_button.dart';
import 'package:final_chit_chat/features/home/presentaion/widgets/drawer.dart';
import 'package:final_chit_chat/features/home/presentaion/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const CustomDrawer(),
        floatingActionButton: const CustomFloatingActionButton(),
        body: const HomeBody());
  }
}
