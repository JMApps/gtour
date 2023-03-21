import 'package:flutter/material.dart';
import 'package:gtour/data/model/user.dart';
import 'package:gtour/data/services/database_helper.dart';

class UsersState extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  List<User>? _usersList = [];

  List<User> get getUsersList => _usersList!;

  Future<void> addUser({required Map<String, dynamic> user}) async {
    await _databaseHelper.addUser(user: user);
    notifyListeners();
  }

  Future<List<User>> getUsers() async {
    final data = await _databaseHelper.getUsers();
    _usersList = data.isNotEmpty ? data.map((e) => User.fromMap(e)).toList() : null;
    return _usersList!;
  }

  Future<void> updateUser({required Map<String, dynamic> user, required int id}) async {
    await _databaseHelper.updateUser(user: user, id: id);
    notifyListeners();
  }

  Future<void> deleteUser({required int id}) async {
    await _databaseHelper.deleteUser(id: id);
    notifyListeners();
  }
}
