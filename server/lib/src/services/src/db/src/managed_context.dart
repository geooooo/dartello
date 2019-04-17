import 'package:aqueduct/aqueduct.dart';
import 'package:server/src/internal/app_config.dart';

import 'account_table.dart';
import 'group_table.dart';
import 'task_table.dart';
import 'team_table.dart';
import 'dashboard_table.dart';

ManagedContext createManagedContext(AppConfig appConfig) => ManagedContext(
  ManagedDataModel([
    DashboardTable,
    AccountTable,
    GroupTable,
    TaskTable,
    TeamTable,
  ]),
  PostgreSQLPersistentStore.fromConnectionInfo(
    appConfig.database.username,
    appConfig.database.password,
    appConfig.database.host,
    appConfig.database.port,
    appConfig.database.databaseName,
  ),
);