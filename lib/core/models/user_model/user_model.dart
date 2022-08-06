class UserModel {
  final String city;
  final String country;
  final String email;
  final String id;
  final String imageUrl;
  final String joinedDate;
  final String name;
  final int postsAmount;
  final int repostsAmount;
  final int quotesAmount;

  UserModel({
    required this.city,
    required this.country,
    required this.email,
    required this.id,
    required this.imageUrl,
    required this.joinedDate,
    required this.name,
    required this.postsAmount,
    required this.repostsAmount,
    required this.quotesAmount,
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
      postsAmount: json['postsAmount'],
      repostsAmount: json['repostsAmount'],
      quotesAmount: json['quotesAmount'],
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
      'postsAmount': postsAmount,
      'repostsAmount': repostsAmount,
      'quotesAmount': quotesAmount,
    };
  }
}
