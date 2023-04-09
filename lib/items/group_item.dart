import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtour/application/theme/app_theme.dart';
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
    final ColorScheme appColors = Theme.of(context).colorScheme;
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
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  item.users,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
              leading: Icon(
                CupertinoIcons.calendar_badge_plus,
                color: appColors.dateIconColors,
              ),
              title: Text(
                'Дата выезда: ${DateFormat('dd-MM-yyyy').format(item.dateTravel)}',
                textAlign: TextAlign.start,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
              leading: Icon(
                CupertinoIcons.calendar,
                color: appColors.accentColor,
              ),
              title: Text(
                'Дата заступления: ${DateFormat('dd-MM-yyyy').format(item.dateEntry)}',
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.doc_on_doc,
                  ),
                  splashRadius: 25,
                  visualDensity:
                      const VisualDensity(vertical: -4, horizontal: -4),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.share,
                  ),
                  splashRadius: 25,
                  visualDensity:
                      const VisualDensity(vertical: -4, horizontal: -4),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
