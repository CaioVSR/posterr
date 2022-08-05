import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/core/controllers/user_session_controller/user_session_controller.dart';
import 'package:posterr/core/repositories/hive_repository/hive_repository.dart';
import 'package:posterr/core/widgets/custom_modal_bottom_sheet.dart';

class SplashPageController {
  final HiveRepository _hiveRepository;
  final UserSessionController userSession;

  SplashPageController({
    required HiveRepository hiveRepository,
    required this.userSession,
  }) : _hiveRepository = hiveRepository;

  Future<void> initialize(BuildContext context) async {
    var result = await _hiveRepository.initialize();

    if (result.isLeft()) {
      CustomModalBottomSheet.builder(
        context: context,
        isDismissible: false,
        title: 'Houston we have a problem...',
        body: 'We are having some problems to initialize the app',
        buttonLabel: 'Try again',
        buttonOnPressed: (() {
          initialize(context);
        }),
      );
    }

    await Future.delayed(const Duration(seconds: 2), () {
      Modular.to.navigate('/home/');
    });
  }
}
