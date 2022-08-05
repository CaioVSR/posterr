import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/modules/home/home_module.dart';
import 'package:posterr/app/modules/profile/profile_module.dart';
import 'package:posterr/app/modules/splash/splash_module.dart';
import 'package:posterr/core/repositories/hive_repository/hive_repository_impl.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HiveRepositoryImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/profile/', module: ProfileModule()),
  ];
}
