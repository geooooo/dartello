import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';
import 'logger_resource_controller.dart';

class LoginController extends LoggerResourceController {

  final DiInjector _diInjector;

  LoginController(this._diInjector);

  @Operation.post()
  Future<Response> sendLogin(@Bind.body() LoginRequest request) async {
    _diInjector.logger.logRestApi(super.method, super.uri, request.asMap());

    final isOk = _diInjector.db.checkAccount(request.login, request.password);
    final response = LoginReponse()..status = isOk? 0 : 1;
    return Response.ok(response);
  }

}

