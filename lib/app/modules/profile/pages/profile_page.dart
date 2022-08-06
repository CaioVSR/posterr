import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/modules/profile/pages/profile_page_controller.dart';
import 'package:posterr/app/modules/profile/widgets/profile_card.dart';
import 'package:posterr/app/modules/profile/widgets/tag_button.dart';
import 'package:posterr/core/models/user_model/user_model.dart';
import 'package:posterr/core/repositories/hive_repository/hive_repository_impl.dart';
import 'package:posterr/core/theme/custom_theme.dart';
import 'package:posterr/core/utils/app_strings.dart';
import 'package:posterr/core/widgets/custom_app_bar.dart';
import 'package:posterr/core/widgets/custom_scaffold.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final HiveRepositoryImpl _hiveRepository = Modular.get();
  final controller = Modular.get<ProfilePageController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      canPop: true,
      appBar: CustomAppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: CustomTheme.colors.darkOrchid,
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
                user: UserModel.fromJson(jsonDecode(_hiveRepository.usersBox.values.first)),
              ),
              const SizedBox(height: 8),
              Divider(
                thickness: 1,
                color: CustomTheme.colors.newPurple,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TagButton(
                    label: AppStrings.getStrings(context).posts,
                    selected: controller.isPostSelected,
                    onPressed: controller.togglePosts,
                  ),
                  TagButton(
                    label: AppStrings.getStrings(context).reposts,
                    selected: controller.isRepostSelected,
                    onPressed: controller.toggleReposts,
                  ),
                  TagButton(
                    label: AppStrings.getStrings(context).quotes,
                    selected: controller.isQuoteSelected,
                    onPressed: controller.toggleQuotes,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
