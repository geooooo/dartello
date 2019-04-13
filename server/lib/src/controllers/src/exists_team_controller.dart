import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class ExistsTeamController extends ResourceController {

  final DiInjector _diInjector;

  ExistsTeamController(this._diInjector);

  @Operation.post()
  Future<Response> existsTeam(@Bind.body() ExistsTeamRequest request) async {
    print(request.asMap());
    final response = ExistsTeamResponse();
    return Response.ok(response);
  }

}

