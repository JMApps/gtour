import 'package:flutter/material.dart';
import 'package:gtour/application/state/users_state.dart';
import 'package:gtour/application/theme/app_theme.dart';
import 'package:gtour/data/model/user.dart';
import 'package:provider/provider.dart';

class ChangeUserBottomSheet extends StatefulWidget {
  const ChangeUserBottomSheet({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<ChangeUserBottomSheet> createState() => _ChangeUserBottomSheetState();
}

class _ChangeUserBottomSheetState extends State<ChangeUserBottomSheet> {
  final _formFirstName = GlobalKey<FormState>();
  final _formSecondName = GlobalKey<FormState>();

  late final TextEditingController _firstNameController;
  late final TextEditingController _secondNameController;

  late Map<String, dynamic> user;

  @override
  void initState() {
    _firstNameController = TextEditingController(text: widget.user.firstName);
    _secondNameController = TextEditingController(text: widget.user.secondName);
    super.initState();
  }

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
                decoration:
                    const InputDecoration(labelText: 'Введите новое имя'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите новое имя';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 8),
            Form(
              key: _formSecondName,
              child: TextFormField(
                controller: _secondNameController,
                autofocus: false,
                autocorrect: false,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    labelText: 'Введите новое имя-перевод'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Введите новое имя-перевод';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 8),
            MaterialButton(
              onPressed: () {
                if (_formFirstName.currentState!.validate() &&
                    _formSecondName.currentState!.validate()) {
                  if (widget.user.firstName != _firstNameController.text ||
                      widget.user.secondName != _secondNameController.text) {
                    Navigator.pop(context);
                    user = {
                      'first_name': _firstNameController.text,
                      'second_name': _secondNameController.text,
                    };
                    context.read<UsersState>().updateUser(user: user, id: widget.user.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        backgroundColor: appColors.accentColor,
                        content: const Text(
                          'Изменено',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                  }
                }
              },
              color: appColors.accentColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'Изменить',
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
