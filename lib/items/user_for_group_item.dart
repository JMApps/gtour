import 'package:flutter/material.dart';
import 'package:gtour/application/state/groups_state.dart';
import 'package:gtour/data/model/user.dart';
import 'package:provider/provider.dart';

class UserForGroupItem extends StatelessWidget {
  const UserForGroupItem({
    Key? key,
    required this.user,
    required this.index,
  }) : super(key: key);

  final User user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(top: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: CheckboxListTile(
        title: Text(
          user.firstName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          user.secondName,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        value: context.watch<GroupsState>().getForGroupUsersList.contains(user.firstName),
        onChanged: (bool? isSelected) {
          context.read<GroupsState>().addUsersForGroup(isSelected: isSelected!, user: user.firstName);
        },
      ),
    );
  }
}
