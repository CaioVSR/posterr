import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_theme.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomFloatingActionButton({
    Key? key,
    required this.label,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: CustomTheme.colors.darkOrchid,
      label: Text(
        label,
        style: CustomTheme.textStyles.bodyRegular(color: CustomTheme.colors.white),
      ),
      onPressed: onPressed,
    );
  }
}
