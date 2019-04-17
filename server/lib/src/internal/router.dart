import 'package:aqueduct/aqueduct.dart';
import 'package:server/src/controllers/controllers.dart';
import 'package:server/src/internal/di_injector.dart';

Router createRouter(DiInjector diInjector) => Router()
  ..route('/login').link(() => LoginController(diInjector))
  ..route('/registration').link(() => RegistrationController(diInjector))
  ..route('/exists_login').link(() => ExistsLoginController(diInjector))
  ..route('/has_team').link(() => HasTeamController(diInjector))
  ..route('/create_team').link(() => CreateTeamController(diInjector))
  ..route('/exists_team').link(() => ExistsTeamController(diInjector))
  ..route('/get_dashboard').link(() => GetDashboardController(diInjector))
  ..route('/create_group').link(() => CreateGroupController(diInjector))
  ..route('/delete_group').link(() => DeleteGroupController(diInjector))
  ..route('/create_task').link(() => CreateTaskController(diInjector))
  ..route('/delete_task').link(() => DeleteTaskController(diInjector))
  ..route('/get_settings').link(() => GetSettingsController(diInjector))
  ..route('/append_account_to_team').link(() => AppendAccountToTeamController(diInjector))
  ..route('/delete_account_from_team').link(() => DeleteAccountFromTeamController(diInjector));


