import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class ExistsTeamController extends ResourceController {

  final DiInjector _diInjector;

  ExistsTeamController(this._diInjector);

  @Operation.post()
  Future<Response> existsTeam(@Bind.body() ExistsTeamRequest request) async {
    _diInjector.logger.logRestApi(this.request.method, this.request.path.string, request.asMap());
    final isExists = await _diInjector.db.existsTeam(request.title);
    final response = ExistsTeamResponse()..status = isExists? 0 : 1;
    return Response.ok(response);
  }

}

