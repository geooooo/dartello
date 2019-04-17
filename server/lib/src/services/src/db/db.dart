import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart' as api_models;
import 'package:server/src/services/src/db/src/managed_context.dart';

import 'src/account_table.dart';
import 'src/dashboard_table.dart';
import 'src/group_table.dart';
import 'src/task_table.dart';
import 'src/team_table.dart';

class Db {

  final ManagedContext _managedContext;

  Db(): _managedContext = createManagedContext();

  Future<void> appendAccountToTeam(String login, String teamTitle) async {
    final querySelectTeam = Query<TeamTable>(_managedContext)
      ..where((TeamTable team) => team.title).equalTo(teamTitle);
    final team = (await querySelectTeam.fetch()).first;

    final queryAppendAccountToTeam = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(login)
      ..values.team = team;
    await queryAppendAccountToTeam.updateOne();
  }

  Future<void> createGroup(api_models.Group group, String teamTitle) async {
    final querySelectTeam = Query<TeamTable>(_managedContext)
      ..where((TeamTable team) => team.title).equalTo(teamTitle);
    final team = (await querySelectTeam.fetch()).first;
    final dashboard = team.dashboard;

    final queryCreateGroup = Query<GroupTable>(_managedContext)
      ..values.title = group.title
      ..values.dashboard = dashboard;
    await queryCreateGroup.insert();
  }

  Future<void> createTask(api_models.Task task, String teamTitle, String groupTitle) async {
    final querySelectTeam = Query<TeamTable>(_managedContext)
      ..where((TeamTable team) => team.title).equalTo(teamTitle);
    final team = (await querySelectTeam.fetch()).first;
    final dashboardId = team.dashboard.id;

    final querySelectGroup = Query<GroupTable>(_managedContext)
      ..where((GroupTable group) => group.dashboard.id).equalTo(dashboardId)
      ..where((GroupTable group) => group.title).equalTo(groupTitle);
    final group = (await querySelectGroup.fetch()).first;

    final querySelectAccount = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(task.responsibleLogin);
    final account = (await querySelectAccount.fetch()).first;

    final queryCreateTask= Query<TaskTable>(_managedContext)
      ..values.title = task.title
      ..values.description = task.description
      ..values.priority = task.priority
      ..values.timePoint = task.timePoint
      ..values.account = account
      ..values.group = group;
    await queryCreateTask.insert();
  }

  void createTeam(String title, String login) async {
    final queryCreateDashboard = Query<DashboardTable>(_managedContext);
    final dashboard = await queryCreateDashboard.insert();

    final queryCreateTeam = Query<TeamTable>(_managedContext)
      ..values.title = title
      ..values.dashboard = dashboard;
    final team = await queryCreateTeam.insert();

    final querySelectAccount = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(login);
    final account = (await querySelectAccount.fetch()).first;

    final queryUpdateAccount = Query<AccountTable>(_managedContext)
      ..where((AccountTable account0) => account0.login).equalTo(account.login)
      ..values.team = team;
    await queryUpdateAccount.updateOne();
  }

  Future<void> deleteAccountFromTeam(String login, String teamTitle) async {
    final querySelectTeam = Query<TeamTable>(_managedContext)
      ..where((TeamTable team) => team.title).equalTo(teamTitle);
    final team = (await querySelectTeam.fetch()).first;

    final queryDeleteFromTeam = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.team.id).equalTo(team.id)
      ..values.team = null;
    await queryDeleteFromTeam.updateOne();
  }

  Future<void> deleteGroup(String groupTitle, String teamTitle) async {
    final querySelectTeam = Query<TeamTable>(_managedContext)
      ..where((TeamTable team) => team.title).equalTo(teamTitle);
    final team = (await querySelectTeam.fetch()).first;
    final dashboardId = team.dashboard.id;

    final queryDeleteGroup = Query<GroupTable>(_managedContext)
      ..where((GroupTable group) => group.dashboard.id).equalTo(dashboardId)
      ..where((GroupTable group) => group.title).equalTo(groupTitle);
    await queryDeleteGroup.delete();
  }

  Future<void> deleteTask(String taskTitle, String groupTitle, String teamTitle) async {
    final querySelectTeam = Query<TeamTable>(_managedContext)
      ..where((TeamTable team) => team.title).equalTo(teamTitle);
    final team = (await querySelectTeam.fetch()).first;
    final dashboardId = team.dashboard.id;

    final querySelectGroup = Query<GroupTable>(_managedContext)
      ..where((GroupTable group) => group.title).equalTo(groupTitle)
      ..where((GroupTable group) => group.dashboard.id).equalTo(dashboardId);
    final group = (await querySelectGroup.fetch()).first;
    final groupId = group.id;

    final queryDeleteTask = Query<TaskTable>(_managedContext)
        ..where((TaskTable task) => task.group.id).equalTo(groupId);
    await queryDeleteTask.delete();
  }

  Future<bool> existsLogin(String login) async {
    final query = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(login);
    final accounts = await query.fetch();
    return accounts.isNotEmpty;
  }

  Future<bool> existsTeam(String title) async {
    final query = Query<TeamTable>(_managedContext)
      ..where((TeamTable team) => team.title).equalTo(title);
    final teams = await query.fetch();
    return teams.isNotEmpty;
  }

  Future<Map<String, Object>> selectDashboard(String login) async {
    final querySelectAccount = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(login);
    final account = (await querySelectAccount.fetch()).first;
    final teamId = account.team.id;

    final querySelectTeam = Query<TeamTable>(_managedContext)
      ..where((TeamTable team) => team.id).equalTo(teamId);
    final team = (await querySelectTeam.fetch()).first;
    final teamTitle = team.title;
    final dashboardId = team.dashboard.id;

    final querySelectGroups = Query<GroupTable>(_managedContext)
      ..where((GroupTable group) => group.dashboard.id).equalTo(dashboardId);
    final groups = await querySelectGroups.fetch();

    final groupsResult = <Map<String, Object>>[];
    for (var group in groups) {
      final querySelectTasksFromGroup = Query<TaskTable>(_managedContext)
        ..where((TaskTable task) => task.group.id).equalTo(group.id);
      final tasks = await querySelectTasksFromGroup.fetch();
      final newGroup = <String, Object>{
        "title": group.title,
        "tasks": <Map<String, Object>>[],
      };
      newGroup["tasks"] = tasks.map((TaskTable task) async {
        final querySelectAccount= Query<AccountTable>(_managedContext)
          ..where((AccountTable account) => account.id).equalTo(task.account.id);
        final account = (await querySelectAccount.fetch()).first;
        final responsibleLogin = account.login;
        return <String, Object>{
          "title": task.title,
          "description": task.description,
          "priority": task.priority,
          "time_point": task.timePoint,
          "responsibleLogin": responsibleLogin,
        };
      });
      groupsResult.add(newGroup);
    }

    return <String, Object>{
      'title': teamTitle,
      'groups': groupsResult,
    };
  }

  Future<Map<String, Object>> selectSettings(String login) async {
    final querySelectAccount = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(login);
    final account = (await querySelectAccount.fetch()).first;
    final teamId = account.team.id;

    final queryAccountsFromOneTeam = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.team.id).equalTo(teamId)
      ..where((AccountTable account) => account.login).notEqualTo(login);
    final accounts = await queryAccountsFromOneTeam.fetch();

    return <String, Object>{
      'logins': accounts.map((AccountTable account) => account.login).toList(),
    };
  }

  Future<bool> hasTeam(String login) async {
    final query = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(login);
    final account = (await query.fetch()).first;
    return account.team != null;
  }

  Future<bool> checkAccount(String login, String password) async {
    final query = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(login)
      ..where((AccountTable account) => account.password).equalTo(password);
    final accounts = await query.fetch();
    return accounts.isNotEmpty;
  }

  Future<void> createAccount(String login, String password) async {
    final query = Query<AccountTable>(_managedContext)
      ..values.login = login
      ..values.password = password;
    await query.insert();
  }

}
