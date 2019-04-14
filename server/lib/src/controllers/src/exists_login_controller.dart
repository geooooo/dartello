import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class ExistsLoginController extends ResourceController {

  final DiInjector _diInjector;

  ExistsLoginController(this._diInjector);

  @Operation.post()
  Future<Response> existsLogin(@Bind.body() ExistsLoginRequest request) async {
    _diInjector.logger.logRestApi(this.request.method, this.request.path.string, request.asMap());
    final isExists = _diInjector.db.existsLogin(request.login);
    final response = ExistsLoginResponse()..status = isExists? 0 : 1;
    return Response.ok(response);
  }

}

