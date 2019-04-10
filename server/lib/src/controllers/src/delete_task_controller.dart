import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

class DeleteTaskController extends ResourceController {

  @Operation.post()
  Future<Response> deleteTask(@Bind.body() DeleteTaskRequest request) async {
    print(request.asMap());
    final response = DeleteTaskResponse();
    return Response.ok(response);
  }

}
