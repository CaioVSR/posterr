class PostModel {
  final String id;
  final String title;
  final String body;
  final String userId;
  final List<String> repostsIds;
  final List<String> quotesIds;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.repostsIds,
    required this.quotesIds,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json['id'] as String,
    title: json['title'] as String,
    body: json['body'] as String,
    userId: json['userId'] as String,
    repostsIds: json['repostsIds'],
    quotesIds: json['quotesIds'],
    // quotesIds: (json['quotesIds'] as List).map((e) => e as String).toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'userId': userId,
    'repostsIds': repostsIds,
    'quotesIds': quotesIds,
  };
}
