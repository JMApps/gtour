class User {
  final int id;
  final String firstName;
  final String secondName;

  User({required this.id, required this.firstName, required this.secondName});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['first_name'],
      secondName: map['second_name'],
    );
  }
}
