import 'package:flutter/material.dart';
import 'package:gtour/items/user_item.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return UserItem(user: snapshot.data![index], index: index);
      },
    );
  }
}
