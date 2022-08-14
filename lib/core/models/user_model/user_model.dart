class UserModel {
  final String city;
  final String country;
  final String email;
  final String id;
  final String imageUrl;
  final String joinedDate;
  final String name;

  UserModel({
    required this.city,
    required this.country,
    required this.email,
    required this.id,
    required this.imageUrl,
    required this.joinedDate,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      city: json['city'],
      country: json['country'],
      email: json['email'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      joinedDate: json['joinedDate'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'country': country,
      'email': email,
      'id': id,
      'imageUrl': imageUrl,
      'joinedDate': joinedDate,
      'name': name,
    };
  }
}
