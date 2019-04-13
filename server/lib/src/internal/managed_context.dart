import 'package:aqueduct/aqueduct.dart';

import 'package:server/src/internal/app_config.dart';

final _config = AppConfig();

ManagedContext createManagedContext() => ManagedContext(
  ManagedDataModel([
  //TODO: tables
  ]),
  PostgreSQLPersistentStore.fromConnectionInfo(
    _config.database.username,
    _config.database.password,
    _config.database.host,
    _config.database.port,
    _config.database.databaseName,
  ),
);