import 'package:flutter/material.dart';
import 'package:posterr/core/widgets/custom_circle_avatar.dart';

class CustomCircleAvatarButton extends StatelessWidget {
  final String imageUrl;
  final double? radius;
  final VoidCallback? onPressed;

  const CustomCircleAvatarButton({
    Key? key,
    this.radius,
    required this.imageUrl,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomCircleAvatar(imageUrl: imageUrl),
    );
  }
}
