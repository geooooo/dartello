import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class LoginController extends ResourceController {

  final DiInjector _diInjector;

  LoginController(this._diInjector);

  @Operation.post()
  Future<Response> sendLogin(@Bind.body() LoginRequest request) async {
    print(request.asMap());
    final response = LoginReponse();
    return Response.ok(response);
  }

}

