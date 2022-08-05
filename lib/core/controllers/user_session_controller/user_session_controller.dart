import 'package:mobx/mobx.dart';
import 'package:posterr/core/models/user_model/user_model.dart';

part 'user_session_controller.g.dart';

class UserSessionController = _UserSessionControllerBase with _$UserSessionController;

abstract class _UserSessionControllerBase with Store {
  final UserModel userModel;

  _UserSessionControllerBase({
    required this.userModel,
  });
}