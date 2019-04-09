import 'package:aqueduct/aqueduct.dart';
import 'models/exists_team.dart';

class ExistsTeamController extends ResourceController {

  @Operation.post()
  Future<Response> existsTeam(@Bind.body() ExistsTeamRequest request) async {
    print(request.asMap());
    final response = ExistsTeamResponse();
    return Response.ok(response);
  }

}

