import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/modules/splash/pages/splash_page_controller.dart';
import 'package:posterr/core/theme/custom_theme.dart';
import 'package:posterr/core/widgets/custom_modal_bottom_sheet.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final pageController = Modular.get<SplashPageController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.initialize(context);
    });
  }

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
