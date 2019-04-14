import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class LoginController extends ResourceController {

  final DiInjector _diInjector;

  LoginController(this._diInjector);

  @Operation.post()
  Future<Response> sendLogin(@Bind.body() LoginRequest request) async {
    _diInjector.logger.logRestApi(this.request.method, this.request.path.string, request.asMap());
    final isOk = await _diInjector.db.checkAccount(request.login, request.password);
    final response = LoginReponse()..status = isOk? 0 : 1;
    print(isOk);
    return Response.ok(response);
  }

}

