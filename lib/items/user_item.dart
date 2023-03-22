import 'package:flutter/material.dart';
import 'package:gtour/application/theme/app_theme.dart';
import 'package:gtour/data/model/user.dart';
import 'package:gtour/widgets/change_delete_user_bottom_sheet.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.user,
    required this.index,
  }) : super(key: key);

  final User user;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(top: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (_) => ChangeDeleteUserBottomSheet(user: user),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: appColors.idCircleBackground,
                child: Text(
                  index.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      user.firstName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.secondName,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
