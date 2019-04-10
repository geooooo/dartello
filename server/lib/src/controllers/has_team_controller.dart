import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

class HasTeamController extends ResourceController {

  @Operation.post()
  Future<Response> hasTeam(@Bind.body() HasTeamRequest request) async {
    print(request.asMap());
    final response = HasTeamResponse();
    return Response.ok(response);
  }

}

