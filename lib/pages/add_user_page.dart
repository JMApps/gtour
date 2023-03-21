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
        title: const Text('Добавить пользователя'),
      ),
      body: FutureBuilder<List>(
        future: context.watch<UsersState>().getUsers(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? UsersList(snapshot: snapshot)
              : const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Добавьте первого пользователя +',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
        },
      ),
      floatingActionButton: const FabAddUser(),
    );
  }
}
