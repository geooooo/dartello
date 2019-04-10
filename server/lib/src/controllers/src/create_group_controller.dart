import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

class CreateGroupController extends ResourceController {

  @Operation.post()
  Future<Response> createGroup(@Bind.body() CreateGroupRequest request) async {
    print(request.asMap());
    final response = CreateGroupResponse();
    return Response.ok(response);
  }

}
