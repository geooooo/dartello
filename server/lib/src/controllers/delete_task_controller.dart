import 'package:aqueduct/aqueduct.dart';
import '../models/delete_task.dart';

class DeleteTaskController extends ResourceController {

  @Operation.post()
  Future<Response> deleteTask(@Bind.body() DeleteTaskRequest request) async {
    print(request.asMap());
    final response = DeleteTaskResponse();
    return Response.ok(response);
  }

}
