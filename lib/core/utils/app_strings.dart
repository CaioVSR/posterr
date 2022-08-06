import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppStrings {
  AppStrings._();

  AppLocalizations getStrings(BuildContext context) => AppLocalizations.of(context)!;
}