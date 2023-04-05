import 'package:flutter/cupertino.dart';
import 'package:gtour/items/group_item.dart';

class GroupsList extends StatelessWidget {
  const GroupsList({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<List<dynamic>> snapshot;

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return GroupItem(
            item: snapshot.data![index],
            index: index,
          );
        },
      ),
    );
  }
}
