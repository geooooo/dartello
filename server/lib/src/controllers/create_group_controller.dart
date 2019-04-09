import 'package:aqueduct/aqueduct.dart';
import '../models/create_group.dart';

class CreateGroupController extends ResourceController {

  @Operation.post()
  Future<Response> createGroup(@Bind.body() CreateGroupRequest request) async {
    print(request.asMap());
    final response = CreateGroupResponse();
    return Response.ok(response);
  }

}
