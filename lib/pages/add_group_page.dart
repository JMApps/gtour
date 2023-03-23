import 'package:flutter/material.dart';
import 'package:gtour/application/state/users_state.dart';
import 'package:gtour/application/theme/app_theme.dart';
import 'package:gtour/lists/users_list.dart';
import 'package:gtour/widgets/release_date_picker.dart';
import 'package:gtour/widgets/travel_date_picker.dart';
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
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: UsersList(snapshot: snapshot),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          TravelDatePicker(),
                          ReleaseDatePicker(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: MaterialButton(
                        onPressed: () {

                        },
                        color: appColors.accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Добавить',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(
                        Icons.person_add_alt_1_outlined,
                        size: 35,
                      ),
                      label: const Text(
                        'Чтобы добавить группу, вы должны сначала добавить пользователей',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
