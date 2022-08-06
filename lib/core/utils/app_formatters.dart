import 'dart:developer';

import 'package:intl/intl.dart';

class AppFormatters {
  AppFormatters._();

  static String formatDate(String date) {
    log(date);
    return DateFormat('MMMM dd, yyyy').format(DateTime.parse(date));
  }

  static String stringShortener({required String text, int maxLength = 14}) {
    if (text.length > maxLength) {
      return text.replaceRange(maxLength, text.length, '...');
    }

    return text;
  }
}
