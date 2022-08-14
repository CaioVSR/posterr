import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_theme.dart';
import 'package:posterr/core/utils/app_strings.dart';
import 'package:posterr/core/widgets/custom_post_name_header.dart';
import 'package:posterr/core/widgets/custom_share_buttons.dart';

class CustomPostCard extends StatelessWidget {
  final bool myPost;
  final bool hasCallback;
  final VoidCallback? onRepostTap;
  final VoidCallback? onQuoteTap;
  final String postDate;
  final String postText;
  final String userName;

  const CustomPostCard({
    Key? key,
    required this.postDate,
    required this.postText,
    required this.userName,
    required this.myPost,
    this.onRepostTap,
    this.onQuoteTap,
    this.hasCallback = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomPostNameHeader(userName: myPost ? AppStrings.getStrings(context).you : userName, postDate: postDate),
        const SizedBox(height: 8),
        Text(
          postText,
          style: CustomTheme.textStyles.bodySmallRegular(),
          textAlign: TextAlign.left,
        ),
        if (hasCallback)
          CustomShareButtons(
            onQuoteTap: onQuoteTap,
            onRepostTap: onRepostTap,
          ),
      ],
    );
  }
}
