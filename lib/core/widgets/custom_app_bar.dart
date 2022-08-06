import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    this.leading,
    this.title,
    this.centerTitle = true,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomTheme.colors.white,
      titleTextStyle: CustomTheme.textStyles.logo(color: CustomTheme.colors.black),
      elevation: 0,
      centerTitle: centerTitle,
      leading: leading,
      title: Text(title ?? ''),
      actions: [
        ...actions ?? [],
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
