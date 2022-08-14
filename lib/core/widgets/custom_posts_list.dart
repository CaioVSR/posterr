import 'package:flutter/material.dart';
import 'package:posterr/core/enums/post_type/post_type_enum.dart';
import 'package:posterr/core/models/post_model.dart/post_model.dart';
import 'package:posterr/core/widgets/custom_post_card.dart';
import 'package:posterr/core/widgets/custom_quote_card.dart';
import 'package:posterr/core/widgets/custom_repost_card.dart';

class CustomPostsList extends StatelessWidget {
  final List<PostModel> postsList;
  final String userId;
  final void Function(PostModel)? onQuoteTap;
  final void Function(PostModel)? onRepostTap;

  const CustomPostsList({
    Key? key,
    required this.postsList,
    required this.userId,
    this.onQuoteTap,
    this.onRepostTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 64),
      itemCount: postsList.length,
      itemBuilder: (context, index) {
        final post = postsList[index];

        if (post.postType == PostTypeEnum.repost) {
          return CustomRepostCard(
            myPost: post.userId == userId,
            myRepost: post.repostUserId == userId,
            postDate: post.postDate,
            postUserName: post.userName,
            repostDate: post.repostDate!,
            repostUserName: post.repostUserName!,
            repostText: post.text,
            quoteTap: post.userId == userId ? null : () => onQuoteTap!(post),
            repostTap: post.userId == userId ? null : () => onRepostTap!(post),
          );
        } else if (post.postType == PostTypeEnum.quote) {
          return CustomQuoteCard(
            myPost: post.userId == userId,
            quoteText: post.quoteText!,
            postText: post.text,
            postDate: post.postDate,
            postUserName: post.userName,
            quoteUserName: post.quoteUserName!,
            quoteDate: post.quoteDate!,
            myQuote: post.quoteUserId! == userId,
          );
        } else {
          return CustomPostCard(
            userName: post.userName,
            postText: post.text,
            myPost: post.userId == userId,
            postDate: post.postDate,
            onQuoteTap: post.userId == userId ? null : () => onQuoteTap!(post),
            onRepostTap: post.userId == userId ? null : () => onRepostTap!(post),
          );
        }
      },
    );
  }
}
