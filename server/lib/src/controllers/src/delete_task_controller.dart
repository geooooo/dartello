import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class DeleteTaskController extends ResourceController {

  final DiInjector _diInjector;

  DeleteTaskController(this._diInjector);

  @Operation.post()
  Future<Response> deleteTask(@Bind.body() DeleteTaskRequest request) async {
    _diInjector.logger.logRestApi(this.request.method, this.request.path.string, request.asMap());
    await _diInjector.db.deleteTask(request.taskTitle, request.groupTitle, request.teamTitle);
    final response = DeleteTaskResponse();
    return Response.ok(response);
  }

}
