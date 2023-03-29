import 'package:gtour/data/model/user.dart';

class Group {
  final int id;
  final List<User> users;
  final DateTime dateTravel;
  final DateTime dateEntry;

  const Group({
    required this.id,
    required this.users,
    required this.dateTravel,
    required this.dateEntry,
  });

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      id: map['id'],
      users: map['users'],
      dateTravel: map['data_travel'],
      dateEntry: map['data_entry'],
    );
  }
}
