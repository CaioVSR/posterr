import 'package:posterr/core/models/post_model.dart/post_model.dart';
import 'package:dartz/dartz.dart';

import 'package:posterr/core/repositories/hive_repository/hive_repository.dart';
import 'package:posterr/core/repositories/posts_repository/posts_repository.dart';
import 'package:posterr/core/repositories/posts_repository/posts_repository_failures.dart';

class PostsRepositoryImpl implements PostsRepository {
  final HiveRepository _client;

  PostsRepositoryImpl(this._client);

  @override
  Either<PostsRepositoryFailures, List<PostModel>> getPosts() {
    return _client.getPosts().fold(
          (l) => left(PostsRepositoryFailures.asUnknown()),
          (r) => right(r),
        );
  }

  @override
  Either<PostsRepositoryFailures, List<PostModel>> getUserPosts(String userId) {
    return _client.getUserPosts(userId).fold(
          (l) => left(PostsRepositoryFailures.asUnknown()),
          (r) => right(r),
        );
  }

  @override
  Future<Either<PostsRepositoryFailures, void>> savePost(PostModel post) async {
    return (await _client.savePost(post)).fold(
      (l) => left(PostsRepositoryFailures.asUnknown()),
      (r) => right(null),
    );
  }
}
