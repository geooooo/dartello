import 'package:aqueduct/aqueduct.dart';
import 'package:aqueduct_test/aqueduct_test.dart';
import 'package:server/src/dartello_app.dart';
import 'package:server/src/internal/app_config.dart';
import 'package:server/src/services/services.dart';
import 'package:server/src/services/src/db/src/account_table.dart';
import 'package:server/src/services/src/db/src/dashboard_table.dart';
import 'package:server/src/services/src/db/src/group_table.dart';
import 'package:server/src/services/src/db/src/task_table.dart';
import 'package:server/src/services/src/db/src/team_table.dart';

class DartelloAppHarness extends TestHarness<DartelloApp> with TestHarnessORMMixin {

  DashboardTable dashboard1;
  DashboardTable dashboard2;
  TeamTable team1;
  TeamTable team2;
  AccountTable account1;
  AccountTable account2;
  AccountTable account3;
  AccountTable account4;
  GroupTable group1;
  GroupTable group2;
  GroupTable group3;
  TaskTable task1;
  TaskTable task2;
  TaskTable task3;

  @override
  ManagedContext get context => channel.diInjector.db.managedContext;

  @override
  Future<void> onSetUp() async {
    channel.appConfig = AppConfig(AppConfig.testConfigPath);
    channel.diInjector.db = Db(channel.appConfig);
    channel.diInjector.logger.isTestingMode = true;
    await resetData();
  }

  @override
  Future<void> seed() async {
    await _fillDashboardTable();
    await _fillTeamTable();
    await _fillAccountTable();
    await _fillGroupTable();
    await _fillTaskTable();
  }

  Future<void> _fillDashboardTable() async {
    dashboard1 = await Query<DashboardTable>(context).insert();
    dashboard2 = await Query<DashboardTable>(context).insert();
  }

  Future<void> _fillTeamTable() async {
    team1 = await ((Query<TeamTable>(context)
      ..values.title = 'team1'
      ..values.dashboard = dashboard1
    ).insert());
    team2 = await ((Query<TeamTable>(context)
      ..values.title = 'team2'
      ..values.dashboard = dashboard2
    ).insert());
  }

  Future<void> _fillAccountTable() async {
    account1 = await ((Query<AccountTable>(context)
      ..values.login = 'login1'
      ..values.password = 'password1'
      ..values.team = team1
    ).insert());
    account2 = await ((Query<AccountTable>(context)
      ..values.login = 'login2'
      ..values.password = 'password2'
      ..values.team = team1
    ).insert());
    account3 = await ((Query<AccountTable>(context)
      ..values.login = 'login3'
      ..values.password = 'password3'
      ..values.team = null
    ).insert());
    account4 = await ((Query<AccountTable>(context)
      ..values.login = 'login4'
      ..values.password = 'password4'
      ..values.team = team2
    ).insert());
  }

  Future<void> _fillGroupTable() async {
    group1 = await ((Query<GroupTable>(context)
      ..values.title = 'group1'
      ..values.dashboard = dashboard1
    ).insert());
    group2 = await ((Query<GroupTable>(context)
      ..values.title = 'group2'
      ..values.dashboard = dashboard1
    ).insert());
    group3 = await ((Query<GroupTable>(context)
      ..values.title = 'group3'
      ..values.dashboard = dashboard2
    ).insert());
  }

  Future<void> _fillTaskTable() async {
    task1 = await ((Query<TaskTable>(context)
      ..values.title = 'task1'
      ..values.description = 'description1'
      ..values.timePoint = 1
      ..values.priority = 2
      ..values.group = group1
      ..values.account = account1
    ).insert());
    task2 = await ((Query<TaskTable>(context)
      ..values.title = 'task2'
      ..values.description = 'description2'
      ..values.timePoint = 1
      ..values.priority = 2
      ..values.group = group1
      ..values.account = account2
    ).insert());
    task3 = await ((Query<TaskTable>(context)
      ..values.title = 'task3'
      ..values.description = 'description3'
      ..values.timePoint = 1
      ..values.priority = 2
      ..values.group = group2
      ..values.account = account3
    ).insert());
  }

}