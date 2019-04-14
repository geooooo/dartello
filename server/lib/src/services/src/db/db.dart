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

  void createTeam(String title) => null;

  void deleteAccountFromTeam(String login, String teamTitle) => null;

  void deleteGroup(String groupTitle, String teamTitle) => null;

  void deleteTask(String taskTitle, String groupTitle, String teamTitle) => null;

  bool existsLogin(String login) => null;

  bool existsTeam(String title) => null;

  Map<String, Object> selectDashboard(String login) => null;

  Map<String, Object> selectSettings(String login, String teamTitle) => null;

  bool hasTeam(String login) => null;

  bool checkAccount(String login, String password) => null;

  Future<void> createAccount(String login, String password) async {
    final query = Query<AccountTable>(_managedContext)
      ..values.login = login
      ..values.password = password;
    await query.insert();
  }

}
