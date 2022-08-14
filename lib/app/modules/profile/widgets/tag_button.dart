import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_colors.dart';
import 'package:posterr/core/theme/custom_theme.dart';

class TagButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onPressed;

  const TagButton({
    Key? key,
    required this.label,
    required this.selected,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: selected ? CustomTheme.colors.newPurple : CustomTheme.colors.gray145),
            color: selected ? CustomTheme.colors.newPurple : CustomColors.instance.white,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              label,
              style: CustomTheme.textStyles
                  .bodySmallRegular(color: selected ? CustomTheme.colors.white : CustomTheme.colors.gray145),
            ),
          ),
        ),
      ),
    );
  }
}
