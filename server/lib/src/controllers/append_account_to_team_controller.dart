import 'package:aqueduct/aqueduct.dart';
import '../models/append_account_to_team.dart';

class AppendAccountToTeamController extends ResourceController {

  @Operation.post()
  Future<Response> appendAccountToTeam(@Bind.body() AppendAccountToTeamRequest request) async {
    print(request.asMap());
    final response = AppendAccountToTeamResponse();
    return Response.ok(response);
  }

}
