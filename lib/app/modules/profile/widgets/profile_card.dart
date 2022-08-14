import 'package:flutter/material.dart';
import 'package:posterr/app/modules/profile/widgets/quantity_badge.dart';
import 'package:posterr/core/models/user_model/user_model.dart';
import 'package:posterr/core/theme/custom_theme.dart';
import 'package:posterr/core/utils/app_formatters.dart';
import 'package:posterr/core/utils/app_strings.dart';
import 'package:posterr/core/widgets/custom_circle_avatar.dart';

class ProfileCard extends StatelessWidget {
  final UserModel user;
  final int postsCount;
  final int repostsCount;
  final int quotesCount;

  const ProfileCard({
    Key? key,
    required this.user,
    required this.postsCount,
    required this.repostsCount,
    required this.quotesCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            SizedBox(
              height: 96,
              child: CustomCircleAvatar(
                radius: 48,
                imageUrl: user.imageUrl,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuantityBadge(label: AppStrings.getStrings(context).posts, quantity: postsCount),
                  QuantityBadge(label: AppStrings.getStrings(context).reposts, quantity: repostsCount),
                  QuantityBadge(label: AppStrings.getStrings(context).quotes, quantity: quotesCount),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          AppFormatters.stringShortener(text: user.name),
          style: CustomTheme.textStyles.headerBold(),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          '${user.city} | ${user.country}',
          style: CustomTheme.textStyles.bodySmallLight(),
        ),
        const SizedBox(height: 4),
        Text(
          'Joined at ${AppFormatters.formatDate(user.joinedDate)}',
          style: CustomTheme.textStyles.bodyTinyLight(),
        ),
      ],
    );
  }
}
