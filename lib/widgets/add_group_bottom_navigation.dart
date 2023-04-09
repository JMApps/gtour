import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gtour/application/state/groups_state.dart';
import 'package:gtour/application/theme/app_theme.dart';
import 'package:provider/provider.dart';

class AddGroupBottomNavigation extends StatelessWidget {
  const AddGroupBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final GroupsState groupState = context.read<GroupsState>();
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(2023, 3, 28),
                  maxTime: DateTime(2030, 12, 31),
                  onConfirm: (date) {
                    groupState.setDateTravel = date;
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.ru,
                );
              },
              iconSize: 35,
              splashRadius: 20,
              color: appColors.dateIconColors,
              icon: const Icon(CupertinoIcons.calendar_badge_plus),
            ),
            IconButton(
                onPressed: () {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime(2023, 3, 28),
                    maxTime: DateTime(2030, 12, 31),
                    onConfirm: (date) {
                      groupState.setDateEntry = date;
                    },
                    currentTime: DateTime.now(),
                    locale: LocaleType.ru,
                  );
                },
                iconSize: 35,
                splashRadius: 20,
                color: appColors.dateIconColors,
                icon: const Icon(CupertinoIcons.calendar)),
            IconButton(
              onPressed: () {
                if (groupState.getForGroupUsersList.isNotEmpty && groupState.dateTravel != null && groupState.dateEntry != null) {
                  Navigator.pop(context);
                  groupState.addGroup();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 2),
                      backgroundColor: appColors.accentColor,
                      content: const Text(
                        'Выберите пользователей и даты',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }
              },
              iconSize: 35,
              splashRadius: 20,
              color: appColors.accentColor,
              icon: const Icon(
                CupertinoIcons.add_circled,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
