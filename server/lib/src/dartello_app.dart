import 'package:aqueduct/aqueduct.dart';

import 'controllers/login_controller.dart';
import 'controllers/exists_login_controller.dart';
import 'controllers/registration_controller.dart';
import 'controllers/has_team_controller.dart';
import 'controllers/create_team_controller.dart';
import 'controllers/exists_team_controller.dart';
import 'controllers/get_dashboard_controller.dart';

class DartelloApp extends ApplicationChannel {

  @override
  Future<void> prepare() async => null;

  @override
  Controller get entryPoint {
    final router = Router();

    router
      .route('/login')
      .link(() => LoginController());

    router
      .route('/registration')
      .link(() => RegistrationController());

    router
      .route('/exists_login')
      .link(() => ExistsLoginController());

    router
      .route('/has_team')
      .link(() => HasTeamController());

    router
      .route('/create_team')
      .link(() => CreateTeamController());

    router
      .route('/exists_team')
      .link(() => ExistsTeamController());

    router
      .route('/get_dashboard')
      .link(() => GetDashboardController());

    // router
    //   .route('/get_dashboard')
    //   .link(() => GetDashboardController());

    return router;
  }

}
