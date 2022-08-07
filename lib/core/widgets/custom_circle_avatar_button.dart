import 'package:flutter/material.dart';

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
      child: Hero(
        tag: 'avatar',
        child: ClipOval(
          clipper: RoundClipper(radius: radius ?? 24),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/chat.png',
            image: imageUrl,
          ),
        ),
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
