import 'package:aqueduct/aqueduct.dart';

import 'package:server/src/internal/app_config.dart';
import 'account_table.dart';
import 'group_table.dart';
import 'task_table.dart';
import 'team_table.dart';
import 'dashboard_table.dart';

final _config = AppConfig();

ManagedContext createManagedContext() => ManagedContext(
  ManagedDataModel([
    DashboardTable,
    AccountTable,
    GroupTable,
    TaskTable,
    TeamTable,
  ]),
  PostgreSQLPersistentStore.fromConnectionInfo(
    _config.database.username,
    _config.database.password,
    _config.database.host,
    _config.database.port,
    _config.database.databaseName,
  ),
);