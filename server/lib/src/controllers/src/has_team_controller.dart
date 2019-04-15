import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class HasTeamController extends ResourceController {

  final DiInjector _diInjector;

  HasTeamController(this._diInjector);

  @Operation.post()
  Future<Response> hasTeam(@Bind.body() HasTeamRequest request) async {
    _diInjector.logger.logRestApi(this.request.method, this.request.path.string, request.asMap());
    final hasTeam = await _diInjector.db.hasTeam(request.login);
    final response = HasTeamResponse()..status = hasTeam? 0 : 1;
    return Response.ok(response);
  }

}

