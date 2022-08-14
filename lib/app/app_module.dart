import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/modules/home/home_module.dart';
import 'package:posterr/app/modules/post/post_module.dart';
import 'package:posterr/app/modules/profile/profile_module.dart';
import 'package:posterr/app/modules/splash/splash_module.dart';
import 'package:posterr/core/controllers/user_session_controller/user_session_controller.dart';
import 'package:posterr/core/repositories/hive_repository/hive_repository_impl.dart';
import 'package:posterr/core/repositories/posts_repository/posts_repository_impl.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HiveRepositoryImpl()),
    Bind.singleton((i) => UserSessionController()),
    Bind.lazySingleton((i) => PostsRepositoryImpl(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule(), transition: TransitionType.fadeIn),
    ModuleRoute('/home/', module: HomeModule(), transition: TransitionType.fadeIn),
    ModuleRoute('/profile/', module: ProfileModule(), transition: TransitionType.fadeIn),
    ModuleRoute('/new-post/', module: PostModule(), transition: TransitionType.downToUp),
  ];
}
