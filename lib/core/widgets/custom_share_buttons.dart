import 'package:flutter/material.dart';

class CustomShareButtons extends StatelessWidget {
  final VoidCallback? onQuoteTap;
  final VoidCallback? onRepostTap;

  const CustomShareButtons({
    Key? key,
    this.onQuoteTap,
    this.onRepostTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: onQuoteTap,
              icon: const Icon(Icons.chat_bubble_outline_rounded),
              iconSize: 20,
            ),
            IconButton(
              onPressed: onRepostTap,
              icon: const Icon(Icons.share_outlined),
              iconSize: 20,
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
