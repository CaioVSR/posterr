import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/core/theme/custom_theme.dart';
import 'package:posterr/core/utils/app_strings.dart';
import 'package:posterr/core/widgets/custom_app_bar.dart';
import 'package:posterr/core/widgets/custom_circle_avatar.dart';
import 'package:posterr/core/widgets/custom_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: AppStrings.getStrings(context).posts,
        actions: [
          InkWell(
            onTap: () {
              Modular.to.pushNamed('/profile/');
            },
            child: CustomCircleAvatar(
              imageUrl: Faker().image.image(keywords: ['Person']),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomTheme.colors.darkOrchid,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
