import 'package:flutter/material.dart';
import 'package:gtour/widgets/add_user_bottom_sheet.dart';

class FabAddUser extends StatelessWidget {
  const FabAddUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: const AddUserBottomSheet(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
