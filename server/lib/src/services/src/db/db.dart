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

  void appendAccountToTeam(String login, String teamTitle) => null;

  void createGroup(api_models.Group group) => null;

  void createTask(api_models.Task task) => null;

  void createTeam(String title, String login) async {
    final queryAccount = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(login);
    final account = (await queryAccount.fetch()).first;

    final queryCreateTeam = Query<TeamTable>(_managedContext)
      ..values.title = title
      ..values.account = account;
    await queryCreateTeam.insert();
  }

  void deleteAccountFromTeam(String login, String teamTitle) => null;

  void deleteGroup(String groupTitle, String teamTitle) => null;

  void deleteTask(String taskTitle, String groupTitle, String teamTitle) => null;

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

  Map<String, Object> selectDashboard(String login) => null;

  Map<String, Object> selectSettings(String login, String teamTitle) => null;

  Future<bool> hasTeam(String login) async {
    final queryAccount = Query<AccountTable>(_managedContext)
      ..where((AccountTable account) => account.login).equalTo(login);
    final accounts = await queryAccount.fetch();
    if (accounts.isEmpty) {
      return false;
    }
    final account = accounts.first;
    final hasTeamQuery = Query<TeamTable>(_managedContext)
      ..where((TeamTable team) => team.account.login).equalTo(account.login);
    final teams = await hasTeamQuery.fetch();
    return teams.isNotEmpty;
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
