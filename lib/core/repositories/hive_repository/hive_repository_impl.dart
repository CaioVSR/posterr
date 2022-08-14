import 'dart:convert';
import 'dart:math';
import 'dart:developer' as developer;
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:posterr/core/models/post_model.dart/post_model.dart';
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
  Future<Either<HiveRepositoryFailures, UserModel>> initialize() async {
    try {
      await Hive.initFlutter();

      final futures = await Future.wait([
        Hive.openBox<String>(_usersBoxName),
        Hive.openBox<String>(_postsBoxName),
      ]);

      usersBox = futures[0];
      postsBox = futures[1];

      // await postsBox.clear();

      if (usersBox.isEmpty) {
        final List<Future<Either<HiveRepositoryFailures, void>>> usersFutures = [];

        for (var i = 0; i < 5; i++) {
          usersFutures.add(saveUser(
            UserModel(
              id: const ShortUuid().generate(),
              name: Faker().person.name(),
              email: Faker().internet.email(),
              country: Faker().address.country(),
              city: Faker().address.city(),
              joinedDate: Faker().date.dateTime(minYear: 2000, maxYear: 2022).toString(),
              imageUrl: Faker().image.image(keywords: ['person']),
            ),
          ));
        }

        await Future.wait(usersFutures);
      }

      var random = Random().nextInt(usersBox.values.length);

      final user = UserModel.fromJson(
        jsonDecode(usersBox.getAt(random)!),
      );

      developer.log(user.name, name: 'Logged user');

      return right(user);
    } catch (e) {
      developer.log('$e', name: 'HiveRepositoryImpl.initialize');
      return left(HiveRepositoryFailures.asUnknown());
    }
  }

  @override
  Future<Either<HiveRepositoryFailures, void>> saveUser(UserModel user) async {
    try {
      if (usersBox.containsKey(user.id)) {
        await usersBox.putAt(indexOfUser(user.id), jsonEncode(user.toJson()));
      } else {
        await usersBox.add(jsonEncode(user.toJson()));
      }
      return right(null);
    } catch (e) {
      developer.log('$e', name: 'HiveRepositoryImpl.saveUser');
      return left(HiveRepositoryFailures.asUnknown());
    }
  }

  @override
  int indexOfUser(String key) {
    return usersBox.values.toList().indexWhere((element) => UserModel.fromJson(jsonDecode(element)).id == key);
  }

  @override
  Either<HiveRepositoryFailures, List<PostModel>> getUserPosts(String userId) {
    try {
      final postsList = postsBox.values
          .map((json) => PostModel.fromJson(jsonDecode(json)))
          .where((post) => post.userId == userId || post.quoteUserId == userId || post.repostUserId == userId)
          .toList();

      return right(postsList);
    } catch (e) {
      developer.log('$e', name: 'HiveRepositoryImpl.getUserPosts');
      return left(HiveRepositoryFailures.asUnknown());
    }
  }

  @override
  Either<HiveRepositoryFailures, List<PostModel>> getPosts() {
    try {
      final postsList = postsBox.values.map((json) => PostModel.fromJson(jsonDecode(json))).toList();

      return right(postsList);
    } catch (e) {
      developer.log('$e', name: 'HiveRepositoryImpl.getPosts');
      return left(HiveRepositoryFailures.asUnknown());
    }
  }

  @override
  Future<Either<HiveRepositoryFailures, void>> savePost(PostModel post) async {
    try {
      await postsBox.add(jsonEncode(post.toJson()));

      return right(null);
    } catch (e) {
      developer.log('$e', name: 'HiveRepositoryImpl.savePosts');
      return left(HiveRepositoryFailures.asUnknown());
    }
  }
}
