import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gtour/application/theme/app_theme.dart';
import 'package:gtour/lists/users_for_group_list.dart';

class AddGroupColumn extends StatelessWidget {
  const AddGroupColumn({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: UsersForGroupList(
            snapshot: snapshot,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(2023, 3, 28),
                  maxTime: DateTime(2030, 12, 31),
                  onConfirm: (date) {},
                  currentTime: DateTime.now(),
                  locale: LocaleType.ru,
                );
              },
              color: appColors.materialButtonColor,
              child: const Text('Дата выезда'),
            ),
            MaterialButton(
              onPressed: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(2023, 3, 28),
                  maxTime: DateTime(2030, 12, 31),
                  onConfirm: (date) {},
                  currentTime: DateTime.now(),
                  locale: LocaleType.ru,
                );
              },
              color: appColors.materialButtonColor,
              child: const Text('Дата заступления'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        MaterialButton(
          onPressed: () {},
          color: appColors.materialButtonColor,
          child: const Text('Добавить'),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
