import 'package:aqueduct/aqueduct.dart';
import '../models/create_task.dart';

class CreateTaskController extends ResourceController {

  @Operation.post()
  Future<Response> createTask(@Bind.body() CreateTaskRequest request) async {
    print(request.asMap());
    final response = CreateTaskResponse();
    return Response.ok(response);
  }

}
