import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/modules/post/pages/post_page_controller.dart';
import 'package:posterr/core/models/post_model.dart/post_model.dart';
import 'package:posterr/core/theme/custom_theme.dart';
import 'package:posterr/core/utils/app_strings.dart';
import 'package:posterr/core/utils/app_validators.dart';
import 'package:posterr/core/widgets/custom_app_bar.dart';
import 'package:posterr/core/widgets/custom_post_card.dart';
import 'package:posterr/core/widgets/custom_primary_button.dart';
import 'package:posterr/core/widgets/custom_scaffold.dart';

class PostPage extends StatefulWidget {
  final PostModel? post;
  const PostPage({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final controller = Modular.get<PostPageController>();
  static const maxLines = 5;
  static const maxLength = 777;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasBodyUnfocus: false,
      resizeToAvoidBottomPadding: true,
      canPop: true,
      appBar: CustomAppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: AppStrings.getStrings(context).newPost,
      ),
      body: Observer(builder: (_) {
        final post = widget.post;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (post != null)
                Expanded(
                  child: SingleChildScrollView(
                    child: CustomPostCard(
                      myPost: false,
                      postText: post.text,
                      postDate: post.postDate,
                      userName: post.repostUserName ?? post.userName,
                    ),
                  ),
                ),
              const SizedBox(height: 4),
              Text(
                '${controller.textLength}/$maxLength',
                style: CustomTheme.textStyles.bodySmallLight(),
                textAlign: TextAlign.right,
              ),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: CustomTheme.colors.gray145),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Form(
                    child: Form(
                      key: controller.formKey,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        controller: controller.textController,
                        maxLength: maxLength,
                        maxLines: maxLines,
                        style: CustomTheme.textStyles.bodyRegular(),
                        autofocus: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        onChanged: (value) => controller.setTextLength(value.length),
                        validator: (text) => AppValidators.noEmptyPost(context: context, text: text!),
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.post == null) const Spacer(),
              CustomPrimaryButton(
                label: AppStrings.getStrings(context).post,
                onPressed: (() async => await controller.savePost(
                      quoteText: post?.text,
                      quoteUserName: post?.userName,
                      quoteDate: post?.postDate,
                      quoteUserId: post?.userId,
                    )),
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    controller.textController.dispose();
    super.dispose();
  }
}
