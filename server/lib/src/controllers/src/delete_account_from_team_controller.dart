import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

class DeleteAccountFromTeamController extends ResourceController {

  @Operation.post()
  Future<Response> deleteAccountFromTeam(@Bind.body() DeleteAccountFromTeamRequest request) async {
    print(request.asMap());
    final response = DeleteAccountFromTeamResponse();
    return Response.ok(response);
  }

}
