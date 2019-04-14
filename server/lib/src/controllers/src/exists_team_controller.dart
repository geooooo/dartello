import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';
import 'logger_resource_controller.dart';

class ExistsTeamController extends LoggerResourceController {

  final DiInjector _diInjector;

  ExistsTeamController(this._diInjector);

  @Operation.post()
  Future<Response> existsTeam(@Bind.body() ExistsTeamRequest request) async {
    _diInjector.logger.logRestApi(super.method, super.uri, request.asMap());

    final isExists = _diInjector.db.existsTeam(request.title);
    final response = ExistsTeamResponse()..status = isExists? 0 : 1;
    return Response.ok(response);
  }

}

