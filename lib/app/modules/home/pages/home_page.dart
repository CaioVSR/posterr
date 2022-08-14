import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/modules/home/pages/home_page_controller.dart';
import 'package:posterr/core/utils/app_strings.dart';
import 'package:posterr/core/widgets/custom_app_bar.dart';
import 'package:posterr/core/widgets/custom_circle_avatar_button.dart';
import 'package:posterr/core/widgets/custom_floating_action_button.dart';
import 'package:posterr/core/widgets/custom_posts_list.dart';
import 'package:posterr/core/widgets/custom_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: AppStrings.getStrings(context).posts,
        leadingWidth: 64,
        leading: Center(
          child: CustomCircleAvatarButton(
            onPressed: () => Modular.to.pushNamed('/profile/'),
            imageUrl: controller.userImage,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(builder: (_) {
          return RefreshIndicator(
            onRefresh: controller.refresh,
            child: CustomPostsList(
              postsList: controller.postsList,
              userId: controller.userId,
              onQuoteTap: controller.quote,
              onRepostTap: controller.repost,
            ),
          );
        }),
      ),
      floatingActionButton: CustomFloatingActionButton(
        label: AppStrings.getStrings(context).newPost,
        onPressed: controller.toPostPage,
      ),
    );
  }
}
