import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

class AppendAccountToTeamController extends ResourceController {

  @Operation.post()
  Future<Response> appendAccountToTeam(@Bind.body() AppendAccountToTeamRequest request) async {
    print(request.asMap());
    final response = AppendAccountToTeamResponse();
    return Response.ok(response);
  }

}
