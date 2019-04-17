import 'dart:io' as io;

import 'package:aqueduct/aqueduct.dart';

class AppConfig extends Configuration {

  static const String configPath = 'config.yaml';
  DatabaseConfiguration database;

  AppConfig() : super.fromFile(io.File(configPath)) {
    Controller.includeErrorDetailsInServerErrorResponses = true;
  }

}