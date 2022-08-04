import 'dart:developer';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/app_module.dart';
import 'package:posterr/app/app_widget.dart';
import 'package:short_uuids/short_uuids.dart';

void main() {
  final faker = Faker();
  print(ShortUuid().generate());
  log(faker.person.name());

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
