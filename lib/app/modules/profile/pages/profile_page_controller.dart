// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:posterr/core/controllers/user_session_controller/user_session_controller.dart';
import 'package:posterr/core/enums/post_type/post_type_enum.dart';
import 'package:posterr/core/models/post_model.dart/post_model.dart';
import 'package:posterr/core/models/user_model/user_model.dart';
import 'package:posterr/core/repositories/posts_repository/posts_repository.dart';

part 'profile_page_controller.g.dart';

class ProfilePageController = _ProfilePageControllerBase with _$ProfilePageController;

abstract class _ProfilePageControllerBase with Store {
  final PostsRepository _postsRepository;
  final UserSessionController _userSessionController;

  _ProfilePageControllerBase({
    required PostsRepository postsRepository,
    required UserSessionController userSessionController,
  })  : _postsRepository = postsRepository,
        _userSessionController = userSessionController {
    getPosts();
  }

  @observable
  ObservableList<PostModel> postsList = <PostModel>[].asObservable();

  void getPosts() {
    _postsRepository.getUserPosts(_userSessionController.user.id).fold(
      (l) => null,
      (r) {
        return postsList =
            (r..sort((a, b) => DateTime.parse(b.postDate).compareTo(DateTime.parse(a.postDate)))).asObservable();
      },
    );
  }

  UserModel get user => _userSessionController.user;

  int get postsCount => postsList
      .where((element) => element.userId == _userSessionController.user.id && element.postType == PostTypeEnum.post)
      .length;

  int get repostsCount => postsList
      .where((element) => element.userId == _userSessionController.user.id && element.postType == PostTypeEnum.repost)
      .length;

  int get quotesCount => postsList
      .where((element) => element.userId == _userSessionController.user.id && element.postType == PostTypeEnum.quote)
      .length;

  void toPostPage() async {
    final posted = await Modular.to.pushNamed('/new-post/') as bool?;

    if (posted != null && posted) {
      getPosts();
    }
  }

  Future<void> refresh() async {
    getPosts();
    return;
  }
}
