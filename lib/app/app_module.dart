import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/modules/home/home_module.dart';
import 'package:posterr/app/modules/profile/profile_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/profile/', module: ProfileModule()),
  ];
}
