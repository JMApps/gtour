import 'package:flutter/material.dart';
import 'package:gtour/application/state/users_state.dart';
import 'package:gtour/lists/users_for_group_list.dart';
import 'package:gtour/widgets/add_group_bottom_navigation.dart';
import 'package:provider/provider.dart';

class AddGroupPage extends StatelessWidget {
  const AddGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить группу'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'add_users_page');
            },
            icon: const Icon(Icons.person_add_alt),
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: context.watch<UsersState>().getUsers(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? UsersForGroupList(
                  snapshot: snapshot,
                )
              : const Center(
                  child: ListTile(
                    title: Icon(
                      Icons.person_add_alt_outlined,
                      size: 35,
                    ),
                    subtitle: Text(
                      'Добавьте пользователей',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
        },
      ),
      bottomNavigationBar: const AddGroupBottomNavigation(),
    );
  }
}
