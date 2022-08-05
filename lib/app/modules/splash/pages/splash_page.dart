import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_colors.dart';
import 'package:posterr/core/theme/custom_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.colors.white,
      body: Center(
        child: Image.asset(CustomTheme.imagesPaths.logo),
      ),
    );
  }
}
