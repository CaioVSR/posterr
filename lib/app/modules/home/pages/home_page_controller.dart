// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:posterr/core/controllers/user_session_controller/user_session_controller.dart';
import 'package:posterr/core/enums/post_type/post_type_enum.dart';
import 'package:posterr/core/models/post_model.dart/post_model.dart';
import 'package:posterr/core/repositories/posts_repository/posts_repository.dart';

part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  final UserSessionController _userSession;
  final PostsRepository _postsRepository;

  @observable
  ObservableList<PostModel> postsList = <PostModel>[].asObservable();

  _HomePageControllerBase({
    required UserSessionController userSession,
    required PostsRepository postsRepository,
  })  : _postsRepository = postsRepository,
        _userSession = userSession {
    getPosts();
  }

  String get userImage => _userSession.user.imageUrl;
  String get userId => _userSession.user.id;

  void getPosts() {
    _postsRepository.getPosts().fold(
      (l) => null,
      (r) {
        return postsList =
            (r..sort((a, b) => DateTime.parse(b.postDate).compareTo(DateTime.parse(a.postDate)))).asObservable();
      },
    );
  }

  Future<void> refresh() async {
    getPosts();
    return;
  }

  void toPostPage() async {
    final posted = await Modular.to.pushNamed('/new-post/') as bool?;

    if (posted != null && posted) {
      getPosts();
    }
  }

  void quote(PostModel post) async {
    final posted = await Modular.to.pushNamed('/new-post/', arguments: post) as bool?;

    if (posted != null && posted) {
      getPosts();
    }
  }

  void repost(PostModel post) async {
    final repost = PostModel(
      postDate: DateTime.now().toString(),
      postType: PostTypeEnum.repost,
      repostDate: post.repostDate ?? post.postDate,
      repostUserId: post.repostUserId ?? post.userId,
      repostUserName: post.repostUserName ?? post.userName,
      text: post.text,
      userId: _userSession.user.id,
      userName: _userSession.user.name,
    );

    final posted = await _postsRepository.savePost(repost);

    posted.fold(
      (l) => null,
      (r) => getPosts(),
    );
  }
}
