import 'dart:io' as io;

import 'package:aqueduct/aqueduct.dart';

class AppConfig extends Configuration {

  static const String productionConfigPath = 'config.yaml';
  static const String testConfigPath = 'config.src.yaml';

  DatabaseConfiguration database;

  AppConfig([String configPath = productionConfigPath]): super.fromFile(io.File(configPath)) {
    if (configPath == productionConfigPath) {
      Controller.includeErrorDetailsInServerErrorResponses = true;
    }
  }

}