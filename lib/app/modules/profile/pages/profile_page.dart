import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/modules/profile/pages/profile_page_controller.dart';
import 'package:posterr/app/modules/profile/widgets/profile_card.dart';
import 'package:posterr/core/theme/custom_theme.dart';
import 'package:posterr/core/utils/app_strings.dart';
import 'package:posterr/core/widgets/custom_app_bar.dart';
import 'package:posterr/core/widgets/custom_floating_action_button.dart';
import 'package:posterr/core/widgets/custom_posts_list.dart';
import 'package:posterr/core/widgets/custom_scaffold.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Modular.get<ProfilePageController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      canPop: true,
      appBar: CustomAppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: AppStrings.getStrings(context).profile,
      ),
      body: Observer(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileCard(
                user: controller.user,
                postsCount: controller.postsCount,
                repostsCount: controller.repostsCount,
                quotesCount: controller.quotesCount,
              ),
              const SizedBox(height: 8),
              Divider(
                thickness: 1,
                color: CustomTheme.colors.gray225,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: CustomPostsList(
                  postsList: controller.postsList,
                  userId: controller.user.id,
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: CustomFloatingActionButton(
        label: AppStrings.getStrings(context).newPost,
        onPressed: controller.toPostPage,
      ),
    );
  }
}
