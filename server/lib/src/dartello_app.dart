import 'package:aqueduct/aqueduct.dart';

import 'controllers/login_controller.dart';
import 'controllers/exists_login_controller.dart';
import 'controllers/registration_controller.dart';

class DartelloApp extends ApplicationChannel {

  @override
  Future<void> prepare() async => null;

  @override
  Controller get entryPoint {
    final router = Router();

    router
      .route("/login")
      .link(() => LoginController());

    router
      .route("/registration")
      .link(() => RegistrationController());

    router
      .route("/exists_login")
      .link(() => ExistsLoginController());

    return router;
  }

}
