import 'package:flutter/material.dart';
import 'package:gtour/data/model/user.dart';
import 'package:gtour/data/services/groups_database_helper.dart';

class GroupsState extends ChangeNotifier {
  final GroupsDatabaseHelper _databaseHelper = GroupsDatabaseHelper();

  final List<User> _forGroupUsersList = [];

  List<User> get getForGroupUsersList => _forGroupUsersList;

  addUsersForGroup({required bool isSelected, required User user}) {
    if (isSelected) {
      _forGroupUsersList.add(user);
    } else {
      _forGroupUsersList.remove(user);
    }
    notifyListeners();
  }
}
