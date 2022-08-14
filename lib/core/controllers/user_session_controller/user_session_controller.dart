// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:posterr/core/models/user_model/user_model.dart';

part 'user_session_controller.g.dart';

class UserSessionController = _UserSessionControllerBase with _$UserSessionController;

abstract class _UserSessionControllerBase with Store {
  late final UserModel user;
}
