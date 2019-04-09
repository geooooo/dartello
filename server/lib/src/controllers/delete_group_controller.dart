import 'package:aqueduct/aqueduct.dart';
import '../models/delete_group.dart';

class DeleteGroupController extends ResourceController {

  @Operation.post()
  Future<Response> deleteGroup(@Bind.body() DeleteGroupRequest request) async {
    print(request.asMap());
    final response = DeleteGroupResponse();
    return Response.ok(response);
  }

}
