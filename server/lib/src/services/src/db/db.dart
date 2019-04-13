import 'package:api_models/api_models.dart';

// import 'src/account_table.dart';
// import 'src/dashboard_table.dart';
// import 'src/group_table.dart';
// import 'src/task_table.dart';
// import 'src/team_table.dart';

// part 'db.g.dart';

// @UseMoor(tables: [
//   AccountTable,
//   TaskTable,
//   TeamTable,
//   GroupTable,
//   DashboardTable,
// ])
// class Db extends _$Db {

//   Db(): super(QueryExecutor());

//   @override
//   int get schemaVersion => 1;

// }

class Db {

//  Database _database = Database('db.sqlite');

  void appendAccountToTeam(String login, String teamTitle) => null;

  void createGroup(Group group) => null;

  void createTask(Task task) => null;

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

  void createAccount(String login, String password) => null;

}
