import 'package:flutter/material.dart';
import 'package:posterr/app/modules/profile/widgets/quantity_badge.dart';
import 'package:posterr/core/models/user_model/user_model.dart';
import 'package:posterr/core/theme/custom_colors.dart';
import 'package:posterr/core/theme/custom_theme.dart';
import 'package:posterr/core/utils/app_formatters.dart';
import 'package:posterr/core/utils/app_strings.dart';
import 'package:posterr/core/widgets/custom_circle_avatar.dart';

class ProfileCard extends StatelessWidget {
  final UserModel user;

  const ProfileCard({
    Key? key,
    required this.user,
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
                  QuantityBadge(label: AppStrings.getStrings(context).posts, quantity: user.postsAmount),
                  QuantityBadge(label: AppStrings.getStrings(context).reposts, quantity: user.repostsAmount),
                  QuantityBadge(label: AppStrings.getStrings(context).quotes, quantity: user.quotesAmount),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          user.name.length > 14 ? '${user.name.substring(0, 14)} ...' : user.name,
          style: CustomTheme.textStyles.headerBold(),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                '${user.city.length <= 12 ? user.city : '${user.city.substring(0, 12).trimRight()}...'} | ${user.country}',
                style: CustomTheme.textStyles.bodySmallLight()),
            Text(
              'Joined at ${AppFormatters.formatDate(user.joinedDate)}',
              style: CustomTheme.textStyles.bodySmallLight(),
            ),
          ],
        ),
      ],
    );
  }
}
