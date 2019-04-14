import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';
import 'logger_resource_controller.dart';

class CreateTaskController extends LoggerResourceController {

  final DiInjector _diInjector;

  CreateTaskController(this._diInjector);

  @Operation.post()
  Future<Response> createTask(@Bind.body() CreateTaskRequest request) async {
    _diInjector.logger.logRestApi(super.method, super.uri, request.asMap());

    _diInjector.db.createTask(request.task);
    final response = CreateTaskResponse();
    return Response.ok(response);
  }

}
