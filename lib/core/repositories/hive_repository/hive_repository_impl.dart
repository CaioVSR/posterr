import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:posterr/core/models/user_model/user_model.dart';
import 'package:posterr/core/repositories/hive_repository/hive_repository.dart';
import 'package:posterr/core/repositories/hive_repository/hive_repository_failures.dart';
import 'package:short_uuids/short_uuids.dart';

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

      await usersBox.clear();

      if (usersBox.isEmpty) {
        for (var i = 0; i < 5; i++) {
          saveUser(
            UserModel(
              id: const ShortUuid().generate(),
              name: Faker().person.name(),
              email: Faker().internet.email(),
              country: Faker().address.country(),
              city: Faker().address.city(),
              joinedDate: Faker().date.dateTime(minYear: 2000, maxYear: 2022).toString(),
              imageUrl: Faker().image.image(keywords: ['person']),
              postsAmount: 0,
              repostsAmount: 0,
              quotesAmount: 0,
            ),
          );
        }
      }

      log('Hive repository initialized with:\nUsers: ${usersBox.values.length}\nPosts: ${postsBox.values.length}');

      return right(null);
    } catch (e) {
      return left(HiveRepositoryFailures.asUnknown());
    }
  }

  @override
  Future<Either<HiveRepositoryFailures, void>> saveUser(UserModel user) async {
    try {
      if (usersBox.containsKey(user.id)) {
        usersBox.putAt(indexOfUser(user.id), jsonEncode(user.toJson()));
      } else {
        usersBox.add(jsonEncode(user.toJson()));
      }
      return right(null);
    } catch (e) {
      return left(HiveRepositoryFailures.asUnknown());
    }
  }

  @override
  int indexOfUser(String key) {
    return usersBox.values.toList().indexWhere((element) => UserModel.fromJson(jsonDecode(element)).id == key);
  }
}
