import 'package:flutter/material.dart';

class GroupsListViewBuilder extends StatelessWidget {
  const GroupsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemBuilder: (context, index) {
        return const Column(
          children: [
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('groupName'),
                    Text('Last message or details here'),
                  ],
                ),
                Spacer(),
              ],
            ),
            Divider(),
          ],
        );
      }),
    );
  }
}
