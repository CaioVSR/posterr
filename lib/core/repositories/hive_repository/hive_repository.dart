import 'package:dartz/dartz.dart';
import 'package:posterr/core/models/user_model/user_model.dart';
import 'package:posterr/core/repositories/hive_repository/hive_repository_failures.dart';

abstract class HiveRepository {
  Future<Either<HiveRepositoryFailures, void>> initialize();
  Future<Either<HiveRepositoryFailures, void>> saveUser(UserModel user);
  int indexOfUser(String key);
}
