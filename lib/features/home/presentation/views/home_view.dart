import 'package:final_chit_chat/core/utils/text_styles.dart';
import 'package:final_chit_chat/core/utils/widgets/custom_app_bar.dart';
import 'package:final_chit_chat/features/home/presentation/views/widgets/custom_floating_action_button.dart';
import 'package:final_chit_chat/features/home/presentation/views/widgets/groups_list_view_builder.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.homeType,
  });
  final int homeType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomFloatingActionButton(),
      body: Column(
        children: [
          CustomAppBar(
            leadingIconButton:
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            actionButton:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            title: 'Groups',
          ),
          homeType == 0
              ? const Text(
                  'No Groupe Created',
                  style: Style.textStyleBold35Black,
                )
              : const GroupsListViewBuilder()
        ],
      ),
    );
  }
}
