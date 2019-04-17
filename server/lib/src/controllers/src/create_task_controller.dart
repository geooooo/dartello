import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class CreateTaskController extends ResourceController {

  final DiInjector _diInjector;

  CreateTaskController(this._diInjector);

  @Operation.post()
  Future<Response> createTask(@Bind.body() CreateTaskRequest request) async {
    _diInjector.logger.logRestApi(this.request.method, this.request.path.string, request.asMap());
    await _diInjector.db.createTask(request.task, request.teamTitle, request.groupTitle);
    final response = CreateTaskResponse();
    return Response.ok(response);
  }

}
