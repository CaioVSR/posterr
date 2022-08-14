import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/modules/post/pages/post_page.dart';
import 'package:posterr/app/modules/post/pages/post_page_controller.dart';

class PostModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PostPageController(
          postsRepository: i(),
          userSessionController: i(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => PostPage(post: args.data)),
  ];
}
