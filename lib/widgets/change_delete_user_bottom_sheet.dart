import 'package:flutter/material.dart';
import 'package:gtour/application/theme/app_theme.dart';
import 'package:gtour/data/model/user.dart';
import 'package:gtour/widgets/change_user_bottom_sheet.dart';
import 'package:gtour/widgets/delete_user_bottom_sheet.dart';

class ChangeDeleteUserBottomSheet extends StatelessWidget {
  const ChangeDeleteUserBottomSheet({Key? key, required this.user}) : super(key: key);

  final User user;

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
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (_) => ChangeUserBottomSheet(
                    user: user,
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Изменить',
                style: TextStyle(
                  fontSize: 16,
                  color: appColors.accentColor,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (_) => DeleteUserBottomSheet(id: user.id),
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
          ],
        ),
      ),
    );
  }
}
