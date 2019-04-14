import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';
import 'logger_resource_controller.dart';

class AppendAccountToTeamController extends LoggerResourceController {

  final DiInjector _diInjector;

  AppendAccountToTeamController(this._diInjector);

  @Operation.post()
  Future<Response> appendAccountToTeam(@Bind.body() AppendAccountToTeamRequest request) async {
    _diInjector.logger.logRestApi(super.method, super.uri, request.asMap());

    _diInjector.db.appendAccountToTeam(request.login, request.teamTitle);
    final response = AppendAccountToTeamResponse();
    return Response.ok(response);
  }

}
