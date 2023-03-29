import 'package:flutter/material.dart';
import 'package:gtour/application/state/users_state.dart';
import 'package:gtour/lists/users_list.dart';
import 'package:gtour/widgets/fab_add_user.dart';
import 'package:provider/provider.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить человека'),
      ),
      body: FutureBuilder<List>(
        future: context.watch<UsersState>().getUsers(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? UsersList(snapshot: snapshot)
              : const Center(
            child: ListTile(
              title: Icon(
                Icons.add,
                size: 35,
              ),
              subtitle: Text(
                'Добавьте пользователя',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
      floatingActionButton: const FabAddUser(),
    );
  }
}
