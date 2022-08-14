import 'package:flutter/material.dart';
import 'package:posterr/core/utils/app_strings.dart';
import 'package:posterr/core/widgets/custom_post_card.dart';
import 'package:posterr/core/widgets/custom_post_name_header.dart';

class CustomRepostCard extends StatelessWidget {
  final bool myPost;
  final bool myRepost;
  final String postDate;
  final String postUserName;
  final String repostText;
  final String repostUserName;
  final String repostDate;
  final VoidCallback? repostTap;
  final VoidCallback? quoteTap;
  final bool hasCallback;

  const CustomRepostCard({
    Key? key,
    required this.myPost,
    required this.repostText,
    required this.postDate,
    required this.postUserName,
    required this.repostUserName,
    required this.repostDate,
    required this.myRepost,
    this.quoteTap,
    this.repostTap,
    this.hasCallback = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPostNameHeader(userName: myPost ? AppStrings.getStrings(context).you : postUserName, postDate: postDate),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: CustomPostCard(
            myPost: myRepost,
            postText: repostText,
            postDate: repostDate,
            userName: repostUserName,
            onQuoteTap: quoteTap,
            onRepostTap: repostTap,
            hasCallback: hasCallback,
          ),
        ),
        if (!hasCallback) const SizedBox(height: 32),
      ],
    );
  }
}
