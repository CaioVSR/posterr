import 'dart:developer';

import 'package:posterr/core/erros/failures.dart';

enum HiveRepositoryFailuresTypes {
  unknown('Unknown error.');

  final String value;

  const HiveRepositoryFailuresTypes(this.value);
}

class HiveRepositoryFailures implements Failures {
  late final HiveRepositoryFailuresTypes _error;

  HiveRepositoryFailures(this._error) {
    _errorLog();
  }

  HiveRepositoryFailuresTypes get failure => _error;

  bool get isUnknown => _error == HiveRepositoryFailuresTypes.unknown;

  void _errorLog() => log(_error.value);

  String get errorMessage => _error.value;

  factory HiveRepositoryFailures.asUnknown() => HiveRepositoryFailures(HiveRepositoryFailuresTypes.unknown);
}
