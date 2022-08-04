import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:posterr/app/app_module.dart';
import 'package:posterr/app/app_widget.dart';
import 'package:posterr/core/repositories/hive_repository/hive_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveRepositoryImpl().initialize();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
