import 'package:aqueduct/aqueduct.dart';
import 'controllers/controllers.dart';

final router = Router()
  ..route('/login').link(() => LoginController())
  ..route('/registration').link(() => RegistrationController())
  ..route('/exists_login').link(() => ExistsLoginController())
  ..route('/has_team').link(() => HasTeamController())
  ..route('/create_team').link(() => CreateTeamController())
  ..route('/exists_team').link(() => ExistsTeamController())
  ..route('/get_dashboard').link(() => GetDashboardController())
  ..route('/create_group').link(() => CreateGroupController())
  ..route('/delete_group').link(() => DeleteGroupController())
  ..route('/create_task').link(() => CreateTaskController())
  ..route('/delete_task').link(() => DeleteTaskController())
  ..route('/get_settings').link(() => GetSettingsController())
  ..route('/append_account_to_team').link(() => AppendAccountToTeamController())
  ..route('/delete_account_from_team').link(() => DeleteAccountFromTeamController());


