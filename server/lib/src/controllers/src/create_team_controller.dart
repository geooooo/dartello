import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class CreateTeamController extends ResourceController {

  final DiInjector _diInjector;

  CreateTeamController(this._diInjector);

  @Operation.post()
  Future<Response> createTeam(@Bind.body() CreateTeamRequest request) async {
    _diInjector.logger.logRestApi(this.request.method, this.request.path.string, request.asMap());
    _diInjector.db.createTeam(request.title);
    final response = CreateTeamResponse();
    return Response.ok(response);
  }

}

