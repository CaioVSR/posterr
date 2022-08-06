import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_theme.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomPrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomTheme.colors.darkOrchid),
        foregroundColor: MaterialStateProperty.all(CustomTheme.colors.white),
        textStyle: MaterialStateProperty.all(CustomTheme.textStyles.bodyRegular()),
      ),
      child: Text(label),
    );
  }
}
