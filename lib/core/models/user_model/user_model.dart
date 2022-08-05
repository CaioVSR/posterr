class UserModel {
  final String id;
  String name;
  final String email;
  final String joinedDate;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.joinedDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      joinedDate: json['joinedDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'joinedDate': joinedDate,
    };
  }
}
