import 'package:dartz/dartz.dart';
import 'package:posterr/core/models/post_model.dart/post_model.dart';
import 'package:posterr/core/repositories/posts_repository/posts_repository_failures.dart';

abstract class PostsRepository {
  Either<PostsRepositoryFailures, List<PostModel>> getPosts();
  Either<PostsRepositoryFailures, List<PostModel>> getUserPosts(String userId);
  Future<Either<PostsRepositoryFailures, void>> savePost(PostModel post);
}
