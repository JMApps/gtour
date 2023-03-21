import 'package:flutter/material.dart';

class FabToAddUserPage extends StatelessWidget {
  const FabToAddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, 'add_users_page');
      },
      child: const Icon(Icons.add),
    );
  }
}
