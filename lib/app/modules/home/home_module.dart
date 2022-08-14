import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/modules/home/pages/home_page_controller.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomePageController(userSession: i(), postsRepository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
