import 'package:flutter/material.dart';
import 'package:gtour/application/state/groups_state.dart';
import 'package:gtour/lists/groups_list.dart';
import 'package:gtour/widgets/fab_add_group_tour.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('GT'),
      ),
      body: FutureBuilder<List>(
        future: context.watch<GroupsState>().getGroups(),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return snapshot.hasData
              ? GroupsList(
                  snapshot: snapshot,
                )
              : const Center(
                  child: ListTile(
                    title: Icon(
                      Icons.add,
                      size: 35,
                    ),
                    subtitle: Text(
                      'Добавьте первую группу',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
        },
      ),
      floatingActionButton: const FabAddGroupTour(),
    );
  }
}
