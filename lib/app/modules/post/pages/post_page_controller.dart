// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:posterr/core/controllers/user_session_controller/user_session_controller.dart';
import 'package:posterr/core/enums/post_type/post_type_enum.dart';
import 'package:posterr/core/models/post_model.dart/post_model.dart';
import 'package:posterr/core/repositories/posts_repository/posts_repository.dart';

part 'post_page_controller.g.dart';

class PostPageController = _PostPageControllerBase with _$PostPageController;

abstract class _PostPageControllerBase with Store {
  final PostsRepository _postsRepository;
  final UserSessionController _userSessionController;
  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @observable
  int textLength = 0;

  _PostPageControllerBase({
    required PostsRepository postsRepository,
    required UserSessionController userSessionController,
  })  : _postsRepository = postsRepository,
        _userSessionController = userSessionController;

  @action
  void setTextLength(int length) {
    textLength = length;
  }

  savePost({
    String? quoteUserName,
    String? quoteText,
    String? quoteDate,
    String? quoteUserId,
  }) async {
    final post = PostModel(
      postDate: DateTime.now().toString(),
      postType: quoteText != null ? PostTypeEnum.quote : PostTypeEnum.post,
      text: textController.text,
      userId: _userSessionController.user.id,
      userName: _userSessionController.user.name,
      quoteUserName: quoteUserName,
      quoteText: quoteText,
      quoteDate: quoteDate,
      quoteUserId: quoteUserId,
    );

    if (formKey.currentState!.validate()) {
      var result = await _postsRepository.savePost(post);

      result.fold(
        (l) => null,
        (_) {
          textController.clear();
          Modular.to.pop(true);
        },
      );
    }
  }
}
