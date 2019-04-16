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
    //
  }

  Future<void> createGroup(api_models.Group group) async {
    //
  }

  Future<void> createTask(api_models.Task task) async {
    //
  }

  void createTeam(String title, String login) async {
    final queryAccount = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(login);
    final account = (await queryAccount.fetch()).first;

    final queryCreateTeam = Query<TeamTable>(_managedContext)
      ..values.title = title;
    final team = await queryCreateTeam.insert();

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
    //
  }

  Future<void> deleteTask(String taskTitle, String groupTitle, String teamTitle) async {
    //
  }

  Future<bool> existsLogin(String login) async {
    final queryAccount = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(login);
    final accounts = await queryAccount.fetch();
    return accounts.isNotEmpty;
  }

  Future<bool> existsTeam(String title) async {
    final queryTeam = Query<TeamTable>(_managedContext)
      ..where((TeamTable team) => team.title).equalTo(title);
    final teams = await queryTeam.fetch();
    return teams.isNotEmpty;
  }

  Future<Map<String, Object>> selectDashboard(String login) async {
    return null;
  }

  Future<Map<String, Object>> selectSettings(String login, String teamTitle) async {
    return null;
  }

  Future<bool> hasTeam(String login) async {
    final queryAccount = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(login);
    final account = (await queryAccount.fetch()).first;
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
