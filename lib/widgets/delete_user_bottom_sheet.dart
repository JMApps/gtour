import 'package:flutter/material.dart';
import 'package:gtour/application/state/users_state.dart';
import 'package:gtour/application/theme/app_theme.dart';
import 'package:provider/provider.dart';

class DeleteUserBottomSheet extends StatelessWidget {
  const DeleteUserBottomSheet({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<UsersState>().deleteUser(id: id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 2),
                    backgroundColor: appColors.accentColor,
                    content: const Text(
                      'Удалено',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Удалить',
                style: TextStyle(
                  fontSize: 16,
                  color: appColors.accentColor,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Отмена',
                style: TextStyle(
                  fontSize: 16,
                  color: appColors.accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
