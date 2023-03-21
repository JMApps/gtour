import 'package:flutter/material.dart';
import 'package:gtour/widgets/fab_to_add_user_page.dart';

class AddGroupPage extends StatelessWidget {
  const AddGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить группу'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'add_users_page');
            },
            icon: const Icon(Icons.person_add_alt_outlined),
          ),
        ],
      ),
      body: Container(),
      floatingActionButton: const FabToAddUserPage(),
    );
  }
}
