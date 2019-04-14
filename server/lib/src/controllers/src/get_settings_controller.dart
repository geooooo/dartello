import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';
import 'logger_resource_controller.dart';

class GetSettingsController extends LoggerResourceController {

  final DiInjector _diInjector;

  GetSettingsController(this._diInjector);

  @Operation.post()
  Future<Response> getSettings(@Bind.body() GetSettingsRequest request) async {
    _diInjector.logger.logRestApi(super.method, super.uri, request.asMap());

    final data = _diInjector.db.selectSettings(request.login, request.teamTitle);
    final response = GetSettingsResponse()..logins = data['logins'];
    return Response.ok(response);
  }

}
