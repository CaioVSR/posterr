import 'package:posterr/core/enums/post_type/post_type_enum.dart';

class PostModel {
  final PostTypeEnum postType;
  final String postDate;
  final String text;
  final String userId;
  final String userName;
  final String? quoteDate;
  final String? quoteText;
  final String? quoteUserId;
  final String? quoteUserName;
  final String? repostDate;
  final String? repostUserId;
  final String? repostUserName;

  PostModel({
    required this.postDate,
    required this.postType,
    required this.text,
    required this.userId,
    required this.userName,
    this.quoteDate,
    this.quoteText,
    this.quoteUserId,
    this.quoteUserName,
    this.repostDate,
    this.repostUserId,
    this.repostUserName,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        postType: PostTypeEnum.fromString(json['postType'] as String),
        postDate: json['postDate'] as String,
        quoteDate: json['quoteDate'] as String?,
        quoteText: json['quoteText'] as String?,
        quoteUserId: json['quoteUserId'] as String?,
        quoteUserName: json['quoteUserName'] as String?,
        repostDate: json['repostDate'] as String?,
        repostUserId: json['repostUserId'] as String?,
        repostUserName: json['repostUserName'] as String?,
        text: json['text'] as String,
        userId: json['userId'] as String,
        userName: json['userName'] as String,
      );

  Map<String, dynamic> toJson() => {
        'postType': postType.value,
        'postDate': postDate,
        'quoteDate': quoteDate,
        'quoteText': quoteText,
        'quoteUserId': quoteUserId,
        'quoteUserName': quoteUserName,
        'repostDate': repostDate,
        'repostUserId': repostUserId,
        'repostUserName': repostUserName,
        'text': text,
        'userId': userId,
        'userName': userName,
      };

  PostModel copyWith({
    PostTypeEnum? postType,
    String? postDate,
    String? quoteDate,
    String? quoteText,
    String? quoteUserId,
    String? quoteUserName,
    String? repostDate,
    String? repostUserId,
    String? repostUserName,
    String? text,
    String? userId,
    String? userName,
  }) =>
      PostModel(
        postType: this.postType,
        postDate: postDate ?? this.postDate,
        quoteDate: quoteDate ?? this.quoteDate,
        quoteText: quoteText ?? this.quoteText,
        quoteUserId: quoteUserId ?? this.quoteUserId,
        quoteUserName: quoteUserName ?? this.quoteUserName,
        repostDate: repostDate ?? this.repostDate,
        repostUserId: repostUserId ?? this.repostUserId,
        repostUserName: repostUserName ?? this.repostUserName,
        text: this.text,
        userId: this.userId,
        userName: this.userName,
      );
}
