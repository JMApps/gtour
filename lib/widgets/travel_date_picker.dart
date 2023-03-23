import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gtour/application/theme/app_theme.dart';

class TravelDatePicker extends StatelessWidget {
  const TravelDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MaterialButton(
      onPressed: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          minTime: DateTime(2023, 3, 23),
          maxTime: DateTime(2030, 12, 31),
          onChanged: (date) {},
          onConfirm: (date) {},
          currentTime: DateTime.now(),
          locale: LocaleType.ru,
        );
      },
      color: appColors.accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Text(
        'Дата поездки',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
