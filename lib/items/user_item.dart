import 'package:flutter/material.dart';
import 'package:gtour/data/model/user.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.user,
    required this.index,
  }) : super(key: key);

  final User user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(user.firstName),
            Text(user.secondName),
          ],
        ),
      ),
    );
  }
}
