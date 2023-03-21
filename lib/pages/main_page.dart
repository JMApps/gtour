import 'package:flutter/material.dart';
import 'package:gtour/widgets/fab_add_group_tour.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('GT'),
      ),
      body: Container(),
      floatingActionButton: const FabAddGroupTour(),
    );
  }
}
