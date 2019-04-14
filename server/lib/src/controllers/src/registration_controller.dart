import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';
import 'logger_resource_controller.dart';

class RegistrationController extends LoggerResourceController {

  final DiInjector _diInjector;

  RegistrationController(this._diInjector);

  @Operation.post()
  Future<Response> sendRegistration(@Bind.body() RegistrationRequest request) async {
    _diInjector.logger.logRestApi(super.method, super.uri, request.asMap());

    await _diInjector.db.createAccount(request.login, request.password);
    final response = RegistrationResponse();

    return Response.ok(response);
  }

}
