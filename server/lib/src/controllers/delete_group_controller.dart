import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

class DeleteGroupController extends ResourceController {

  @Operation.post()
  Future<Response> deleteGroup(@Bind.body() DeleteGroupRequest request) async {
    print(request.asMap());
    final response = DeleteGroupResponse();
    return Response.ok(response);
  }

}
