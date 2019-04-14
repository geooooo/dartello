import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class GetSettingsController extends ResourceController {

  final DiInjector _diInjector;

  GetSettingsController(this._diInjector);

  @Operation.post()
  Future<Response> getSettings(@Bind.body() GetSettingsRequest request) async {

    print(request.asMap());

    final data = _diInjector.db.selectSettings(request.login, request.teamTitle);
    final response = GetSettingsResponse()..logins = data['logins'];
    return Response.ok(response);
  }

}
