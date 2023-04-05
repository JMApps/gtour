import 'package:flutter/material.dart';
import 'package:gtour/data/model/group.dart';
import 'package:intl/intl.dart';

class GroupItem extends StatelessWidget {
  const GroupItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final Group item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(top: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(item.users),
            const SizedBox(height: 8),
            Text(
              'Дата выезда: ${DateFormat.yMd().format(item.dateTravel)}',
              textAlign: TextAlign.start,
            ),
            Text(
              'Дата заступления: ${DateFormat.yMd().format(item.dateEntry)}',
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
