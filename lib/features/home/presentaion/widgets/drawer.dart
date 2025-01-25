import 'package:final_chit_chat/constans.dart';
import 'package:final_chit_chat/core/utils/services/auth_services.dart';
import 'package:final_chit_chat/core/utils/text_styles.dart';
import 'package:final_chit_chat/features/auth/presentation/log_in/presentation/view/log_in_view.dart';
import 'package:final_chit_chat/features/home/presentaion/home_view.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Icon(
            Icons.account_circle,
            size: 150,
            color: Colors.grey[850],
          ),
          const Text(
            'fullName',
            style: Style.textStyle18,
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HomeView();
              }));
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            leading: const Icon(
              Icons.group,
              color: kPrimaryColor,
            ),
            title: const Text('Group'),
          ),
          ListTile(
            onTap: () {},
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {
              AuthServices().logOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginView();
              }));
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
