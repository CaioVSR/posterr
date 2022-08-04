import 'dart:developer';

import 'package:posterr/core/erros/failures.dart';

enum HiveRepositoryFailuresTypes {
  unknown('Unknown error');

  final String value;

  const HiveRepositoryFailuresTypes(this.value);
}

class HiveRepositoryFailures implements Failures {
  late final HiveRepositoryFailuresTypes _error;

  HiveRepositoryFailures(this._error) {
    errorLog();
  }

  HiveRepositoryFailuresTypes get failure => _error;

  bool get isUnknown => _error == HiveRepositoryFailuresTypes.unknown;

  void errorLog() => log(_error.value);

  factory HiveRepositoryFailures.asUnknown() => HiveRepositoryFailures(HiveRepositoryFailuresTypes.unknown);
}
