import 'package:flutter/material.dart';
import 'package:posterr/core/utils/app_strings.dart';

class AppValidators {
  static String? noEmptyPost({required String text, required BuildContext context}) {
    if (text.isEmpty) {
      return AppStrings.getStrings(context).emptyPostMessage;
    }

    return null;
  }
}
