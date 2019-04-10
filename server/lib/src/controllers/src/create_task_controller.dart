import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

class CreateTaskController extends ResourceController {

  @Operation.post()
  Future<Response> createTask(@Bind.body() CreateTaskRequest request) async {
    print(request.asMap());
    final response = CreateTaskResponse();
    return Response.ok(response);
  }

}
