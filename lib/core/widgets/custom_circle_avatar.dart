import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_theme.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final double? radius;

  const CustomCircleAvatar({
    Key? key,
    this.radius,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: RoundClipper(radius: radius ?? 24),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Image.asset(CustomTheme.imagesPaths.chatLogo),
        errorWidget: (context, url, error) => Image.asset(CustomTheme.imagesPaths.chatLogo),
      ),
    );
  }
}

class RoundClipper extends CustomClipper<Rect> {
  final double radius;

  RoundClipper({required this.radius});

  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
