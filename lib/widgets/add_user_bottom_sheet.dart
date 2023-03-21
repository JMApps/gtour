import 'package:flutter/material.dart';
import 'package:gtour/application/state/users_state.dart';
import 'package:gtour/application/theme/app_theme.dart';
import 'package:provider/provider.dart';

class AddUserBottomSheet extends StatefulWidget {
  const AddUserBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddUserBottomSheet> createState() => _AddUserBottomSheetState();
}

class _AddUserBottomSheetState extends State<AddUserBottomSheet> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  late Map<String, dynamic> user;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _firstNameController,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _secondNameController,
            ),
            const SizedBox(height: 8),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                user = {
                  'first_name': _firstNameController.text,
                  'second_name': _secondNameController.text,
                };
                context.read<UsersState>().addUser(user: user);
              },
              color: appColors.accentColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'Добавить',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
