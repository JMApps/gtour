import 'package:flutter/material.dart';
import 'package:gtour/data/model/group.dart';
import 'package:gtour/data/services/groups_database_helper.dart';

class GroupsState extends ChangeNotifier {
  final GroupsDatabaseHelper _databaseHelper = GroupsDatabaseHelper();

  List<Group>? _groupsList = [];

  final List<String> _forGroupUsersList = [];

  List<String> get getForGroupUsersList => _forGroupUsersList;

  DateTime? _dateTravel;

  DateTime? _dateEntry;

  addUsersForGroup({required bool isSelected, required String user}) {
    if (isSelected) {
      _forGroupUsersList.add(user);
    } else {
      _forGroupUsersList.remove(user);
    }
    notifyListeners();
  }

  set setDateTravel(DateTime value) {
    _dateTravel = value;
    notifyListeners();
  }

  set setDateEntry(DateTime value) {
    _dateEntry = value;
    notifyListeners();
  }

  DateTime? get dateTravel => _dateTravel;

  DateTime? get dateEntry => _dateEntry;

  Future<void> addGroup() async {
    await _databaseHelper.addGroup(
      group: Group(
        users: _forGroupUsersList.join(',\n'),
        dateTravel: _dateTravel!,
        dateEntry: _dateEntry!,
      ),
    );
    notifyListeners();
  }

  Future<List<Group>> getGroups() async {
    final data = await _databaseHelper.getGroups();
    _groupsList = data.isNotEmpty ? data.map((e) => Group.fromMap(e)).toList() : null;
    return _groupsList!;
  }
}
