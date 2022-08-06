import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/modules/profile/pages/profile_page.dart';
import 'package:posterr/app/modules/profile/pages/profile_page_controller.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfilePageController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const ProfilePage()),
  ];
}
