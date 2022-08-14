import 'dart:developer';

import 'package:posterr/core/erros/failures.dart';

enum PostsRepositoryFailuresTypes {
  unknown('Unknown error.');

  final String value;

  const PostsRepositoryFailuresTypes(this.value);
}

class PostsRepositoryFailures implements Failures {
  late final PostsRepositoryFailuresTypes _error;

  PostsRepositoryFailures(this._error) {
    _errorLog();
  }

  String get errorMessage => _error.value;

  PostsRepositoryFailuresTypes get failure => _error;

  bool get isUnknown => _error == PostsRepositoryFailuresTypes.unknown;

  void _errorLog() => log(_error.value);

  factory PostsRepositoryFailures.asUnknown() => PostsRepositoryFailures(PostsRepositoryFailuresTypes.unknown);
}
