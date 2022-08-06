import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_theme.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String label;
  const CustomCircleAvatar({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: CustomTheme.colors.robinsEggBlue,
      child: Text(
        label.substring(0, 2),
        style: CustomTheme.textStyles.bodyBold(color: CustomTheme.colors.white),
      ),
    );
  }
}
