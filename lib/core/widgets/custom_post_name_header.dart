import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_theme.dart';
import 'package:posterr/core/utils/app_formatters.dart';

class CustomPostNameHeader extends StatelessWidget {
  final String postDate;
  final String userName;

  const CustomPostNameHeader({
    Key? key,
    required this.postDate,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppFormatters.stringShortener(text: userName),
          style: CustomTheme.textStyles.bodyBold(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CircleAvatar(radius: 2, backgroundColor: CustomTheme.colors.darkOrchid),
        ),
        Text(
          AppFormatters.timeDifference(date: postDate, context: context),
          style: CustomTheme.textStyles.bodyTinyLight(),
        ),
      ],
    );
  }
}
