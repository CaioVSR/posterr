import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/modules/splash/pages/splash_page.dart';
import 'package:posterr/app/modules/splash/pages/splash_page_controller.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SplashPageController(hiveRepository: i(), userSession: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const SplashPage()),
  ];
}
