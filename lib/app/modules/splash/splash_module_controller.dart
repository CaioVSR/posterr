import 'package:dartz/dartz.dart';
import 'package:posterr/core/repositories/hive_repository/hive_repository.dart';

class SplashModuleController {
  final HiveRepository _hiveRepository;

  SplashModuleController({
    required HiveRepository hiveRepository,
  }) : _hiveRepository = hiveRepository {}

  Future<void> initializeModule() async {
    _hiveRepository.initialize();
  }
}
