class Group {
  final String users;
  final DateTime dateTravel;
  final DateTime dateEntry;

  const Group({
    required this.users,
    required this.dateTravel,
    required this.dateEntry,
  });

  Map<String, dynamic> toMap() {
    return {
      'users': users,
      'data_travel': dateTravel.toIso8601String(),
      'data_entry': dateEntry.toIso8601String(),
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      users: map['users'],
      dateTravel: DateTime.parse(map['data_travel']),
      dateEntry: DateTime.parse(map['data_entry']),
    );
  }
}
