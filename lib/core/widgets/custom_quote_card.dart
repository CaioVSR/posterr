import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_theme.dart';
import 'package:posterr/core/utils/app_strings.dart';
import 'package:posterr/core/widgets/custom_post_card.dart';
import 'package:posterr/core/widgets/custom_post_name_header.dart';

class CustomQuoteCard extends StatelessWidget {
  final bool myPost;
  final bool myQuote;
  final String postDate;
  final String postText;
  final String postUserName;
  final String quoteText;
  final String quoteUserName;
  final String quoteDate;
  final VoidCallback? repostTap;
  final VoidCallback? quoteTap;

  const CustomQuoteCard({
    Key? key,
    required this.myPost,
    required this.quoteText,
    required this.postText,
    required this.postDate,
    required this.postUserName,
    required this.quoteUserName,
    required this.quoteDate,
    required this.myQuote,
    this.quoteTap,
    this.repostTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomPostNameHeader(
          userName: myPost ? AppStrings.getStrings(context).you : postUserName,
          postDate: postDate,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: CustomTheme.colors.gray225),
                left: BorderSide(color: CustomTheme.colors.gray225),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: CustomPostCard(
                hasCallback: false,
                myPost: myQuote,
                postText: quoteText,
                postDate: quoteDate,
                userName: quoteUserName,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          postText,
          style: CustomTheme.textStyles.bodySmallRegular(),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
