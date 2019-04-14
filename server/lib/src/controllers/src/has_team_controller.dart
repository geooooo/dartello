import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class HasTeamController extends ResourceController {

  final DiInjector _diInjector;

  HasTeamController(this._diInjector);

  @Operation.post()
  Future<Response> hasTeam(@Bind.body() HasTeamRequest request) async {
    print(request.asMap());
    final response = HasTeamResponse();
    return Response.ok(response);
  }

}
