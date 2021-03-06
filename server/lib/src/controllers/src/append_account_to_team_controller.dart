import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class AppendAccountToTeamController extends ResourceController {

  final DiInjector _diInjector;

  AppendAccountToTeamController(this._diInjector);

  @Operation.post()
  Future<Response> appendAccountToTeam(@Bind.body() AppendAccountToTeamRequest request) async {
    _diInjector.logger.logRestApi(this.request.method, this.request.path.string, request.asMap());
    await _diInjector.db.appendAccountToTeam(request.login, request.teamTitle);
    final response = AppendAccountToTeamResponse();
    return Response.ok(response);
  }

}
