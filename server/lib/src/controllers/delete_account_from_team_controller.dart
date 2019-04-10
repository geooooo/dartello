import 'package:aqueduct/aqueduct.dart';
import '../models/delete_account_from_team.dart';

class DeleteAccountFromTeamController extends ResourceController {

  @Operation.post()
  Future<Response> deleteAccountFromTeam(@Bind.body() DeleteAccountFromTeamRequest request) async {
    print(request.asMap());
    final response = DeleteAccountFromTeamResponse();
    return Response.ok(response);
  }

}
