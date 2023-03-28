import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gtour/application/theme/app_theme.dart';

class AddGroupColumn extends StatelessWidget {
  const AddGroupColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 50,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text('$index'),
                  ),
                ),
              );
            },
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
                  onChanged: (date) {
                    print('change $date');
                  },
                  onConfirm: (date) {
                    print('confirm $date');
                  },
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
                  onChanged: (date) {
                    print('change $date');
                  },
                  onConfirm: (date) {
                    print('confirm $date');
                  },
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
