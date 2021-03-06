import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class RegistrationController extends ResourceController {

  final DiInjector _diInjector;

  RegistrationController(this._diInjector);

  @Operation.post()
  Future<Response> sendRegistration(@Bind.body() RegistrationRequest request) async {
    _diInjector.logger.logRestApi(this.request.method, this.request.path.string, request.asMap());
    await _diInjector.db.createAccount(request.login, request.password);
    final response = RegistrationResponse();
    return Response.ok(response);
  }

}
