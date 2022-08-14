import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posterr/core/utils/app_strings.dart';

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

  static String timeDifference({required String date, required BuildContext context}) {
    final difference = DateTime.now().difference(DateTime.parse(date));
    final strings = AppStrings.getStrings(context);

    if (difference.inDays > 0) {
      return '${difference.inDays.toString()} ${strings.daysAgo}';
    }

    if (difference.inHours > 0) {
      return '${difference.inHours.toString()} ${strings.hoursAgo}';
    }

    if (difference.inMinutes > 0) {
      return '${difference.inMinutes.toString()} ${strings.minutesAgo}';
    }

    return strings.momentsAgo;
  }
}
