import 'package:flutter/material.dart';

class FabAddGroupTour extends StatelessWidget {
  const FabAddGroupTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, 'add_group_tour_page');
      },
      child: const Icon(Icons.add),
    );
  }
}
