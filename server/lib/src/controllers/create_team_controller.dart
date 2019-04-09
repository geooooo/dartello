import 'package:aqueduct/aqueduct.dart';
import 'models/create_team.dart';

class CreateTeamController extends ResourceController {

  @Operation.post()
  Future<Response> createTeam(@Bind.body() CreateTeamRequest request) async {
    print(request.asMap());
    final response = CreateTeamResponse();
    return Response.ok(response);
  }

}

