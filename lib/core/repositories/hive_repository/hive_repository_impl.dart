import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:posterr/core/repositories/hive_repository/hive_repository.dart';
import 'package:posterr/core/repositories/hive_repository/hive_repository_failures.dart';

class HiveRepositoryImpl implements HiveRepository {
  final String _usersBoxName = 'users';
  final String _postsBoxName = 'posts';
  late final Box<String> usersBox;
  late final Box<String> postsBox;

  @override
  Future<Either<HiveRepositoryFailures, void>> initialize() async {
    try {
      await Hive.initFlutter();

      var futures = await Future.wait([
        Hive.openBox<String>(_usersBoxName),
        Hive.openBox<String>(_postsBoxName),
      ]);

      usersBox = futures[0];
      postsBox = futures[1];

      log('Hive repository initialized with:\nUsers: ${usersBox.values.length}\nPosts: ${postsBox.values.length}');

      return right(null);
    } catch (e) {
      return left(HiveRepositoryFailures.asUnknown());
    }
  }
}
