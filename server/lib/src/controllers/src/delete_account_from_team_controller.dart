import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class DeleteAccountFromTeamController extends ResourceController {

  final DiInjector _diInjector;

  DeleteAccountFromTeamController(this._diInjector);

  @Operation.post()
  Future<Response> deleteAccountFromTeam(@Bind.body() DeleteAccountFromTeamRequest request) async {

    print(request.asMap());

    _diInjector.db.deleteAccountFromTeam(request.login, request.teamTitle);
    final response = DeleteAccountFromTeamResponse();
    return Response.ok(response);
  }

}
