import 'dart:developer';

import 'package:intl/intl.dart';

class AppFormatters {
  AppFormatters._();

  static String formatDate(String date) {
    log(date);
    return DateFormat('MMMM dd, yyyy').format(DateTime.parse(date));
  }
}
