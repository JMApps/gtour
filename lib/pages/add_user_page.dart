import 'package:flutter/material.dart';
import 'package:gtour/widgets/fab_add_user.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить пользователя'),
      ),
      body: Container(),
      floatingActionButton: const FabAddUser(),
    );
  }
}
