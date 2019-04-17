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

  DashboardTable _dashboard1;
  DashboardTable _dashboard2;
  TeamTable _team1;
  TeamTable _team2;
  AccountTable _account1;
  AccountTable _account2;
  AccountTable _account3;
  AccountTable _account4;
  GroupTable _group1;
  GroupTable _group2;
  GroupTable _group3;
  TaskTable _task1;
  TaskTable _task2;
  TaskTable _task3;

  @override
  ManagedContext get context => channel.diInjector.db.managedContext;

  @override
  Future<void> onSetUp() async {
    channel.appConfig = AppConfig(AppConfig.testConfigPath);
    channel.diInjector.db = Db(channel.appConfig);
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
    _dashboard1 = await Query<DashboardTable>(context).insert();
    _dashboard2 = await Query<DashboardTable>(context).insert();
  }

  Future<void> _fillTeamTable() async {
    _team1 = await ((Query<TeamTable>(context)
        ..values.title = 'team1'
        ..values.dashboard = _dashboard1
    ).insert());
    _team2 = await ((Query<TeamTable>(context)
      ..values.title = 'team2'
      ..values.dashboard = _dashboard2
    ).insert());
  }

  Future<void> _fillAccountTable() async {
    _account1 = await ((Query<AccountTable>(context)
      ..values.login = 'login1'
      ..values.password = 'password1'
      ..values.team = _team1
    ).insert());
    _account2 = await ((Query<AccountTable>(context)
      ..values.login = 'login2'
      ..values.password = 'password2'
      ..values.team = _team1
    ).insert());
    _account3 = await ((Query<AccountTable>(context)
      ..values.login = 'login3'
      ..values.password = 'password3'
      ..values.team = _team1
    ).insert());
    _account4 = await ((Query<AccountTable>(context)
      ..values.login = 'login4'
      ..values.password = 'password4'
      ..values.team = _team2
    ).insert());
  }

  Future<void> _fillGroupTable() async {
    _group1 = await ((Query<GroupTable>(context)
      ..values.title = 'group1'
      ..values.dashboard = _dashboard1
    ).insert());
    _group2 = await ((Query<GroupTable>(context)
      ..values.title = 'group2'
      ..values.dashboard = _dashboard1
    ).insert());
    _group3 = await ((Query<GroupTable>(context)
      ..values.title = 'group3'
      ..values.dashboard = _dashboard2
    ).insert());
  }

  Future<void> _fillTaskTable() async {
    _task1 = await ((Query<TaskTable>(context)
      ..values.title = 'task1'
      ..values.description = 'description1'
      ..values.timePoint = 1
      ..values.priority = 2
      ..values.group = _group1
      ..values.account = _account1
    ).insert());
    _task2 = await ((Query<TaskTable>(context)
      ..values.title = 'task2'
      ..values.description = 'description2'
      ..values.timePoint = 1
      ..values.priority = 2
      ..values.group = _group1
      ..values.account = _account2
    ).insert());
    _task3 = await ((Query<TaskTable>(context)
      ..values.title = 'task3'
      ..values.description = 'description3'
      ..values.timePoint = 1
      ..values.priority = 2
      ..values.group = _group2
      ..values.account = _account3
    ).insert());
  }

}