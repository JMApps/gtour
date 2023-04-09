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
  final _formFirstName = GlobalKey<FormState>();

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
            Form(
              key: _formFirstName,
              child: TextFormField(
                controller: _firstNameController,
                autofocus: true,
                autocorrect: false,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(labelText: 'Введите имя'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите имя';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _secondNameController,
              autofocus: false,
              autocorrect: false,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(labelText: 'Введите имя-перевод'),
            ),
            const SizedBox(height: 8),
            MaterialButton(
              onPressed: () {
                if (_formFirstName.currentState!.validate()) {
                  Navigator.pop(context);
                  user = {
                    'first_name': _firstNameController.text,
                    'second_name': _secondNameController.text,
                  };
                  context.read<UsersState>().addUser(user: user);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 2),
                      backgroundColor: appColors.accentColor,
                      content: const Text(
                        'Добавлено',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }
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
