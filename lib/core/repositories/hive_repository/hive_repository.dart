import 'package:dartz/dartz.dart';
import 'package:posterr/core/models/post_model.dart/post_model.dart';
import 'package:posterr/core/models/user_model/user_model.dart';
import 'package:posterr/core/repositories/hive_repository/hive_repository_failures.dart';

abstract class HiveRepository {
  Future<Either<HiveRepositoryFailures, UserModel>> initialize();
  Either<HiveRepositoryFailures, List<PostModel>> getUserPosts(String userId);
  Future<Either<HiveRepositoryFailures, void>> saveUser(UserModel user);
  Future<Either<HiveRepositoryFailures, void>> savePost(PostModel post);
  Either<HiveRepositoryFailures, List<PostModel>> getPosts();
  int indexOfUser(String key);
}
